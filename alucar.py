from flask import Flask, render_template,request, redirect
import pymysql


app = Flask(__name__)
#app.debug = True

#app = Flask(__name__, template_folder='templates', static_folder='static')
#app = Flask(__name__, static_url_path='/static', static_folder='static')

class Database:
    def __init__(self):
        host = "127.0.0.1"
        user = "asisbd_user"
        password = "#asisBD12"
        db = "alucar"
        self.con = pymysql.connect(host=host, user=user, password=password, db=db, cursorclass=pymysql.cursors.DictCursor)
        self.cur = self.con.cursor()

    def lista_carros(self):
        self.cur.execute("SELECT marca, modelo, preco_aluger, numero_portas, acentos FROM veiculos")
        result = self.cur.fetchall()
        return result

@app.route('/')
def index():
    return render_template("index.html")


@app.route('/Veiculos', methods=['GET', 'POST'])
def veiculos():
    def db_query():
        db = Database()
        veiculos = db.lista_carros()
        return veiculos

    if request.method == 'POST':
        nome_cliente = request.form['nome_cliente']
        veiculos_id = request.form['veiculos_id']
        data_entrega_veiculos = request.form['data_entrega_veiculos']
        data_retoma_veiculos = request.form['data_retoma_veiculos']

        db = Database()
        cursor = db.cur
        query = "CALL base_de_dados (%s, %s, %s, %s, @cliente_id, @veiculo_id)"
        values = (nome_cliente, veiculos_id, data_entrega_veiculos, data_retoma_veiculos)
        cursor.execute(query, values)

        db.con.commit()
        return redirect('/Veiculos')

    res = db_query()
    return render_template("Veiculos.html", result=res)

@app.route('/login')
def login():
    return render_template("login.html")

@app.route('/<string:name>')
def error(name):
    return f'<h3>Desculpe, mas a página "{name}" não existe ou não foi encontrada :(</h3>'

@app.route('/criarconta', methods=['GET', 'POST'])
def criar_conta():
    if request.method == 'POST':
        nome = request.form['nome']
        email = request.form['email']
        data_nascimento = request.form['data_nascimento']
        NIF = request.form['NIF']
        endereco = request.form['endereco']
        password = request.form['password']
        
        db = Database()
        cursor = db.cur
        query = "INSERT INTO clientes (nome, NIF, endereço, contactos, data_nascimento, password) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (nome, NIF, endereco, email, data_nascimento, password)
        cursor.execute(query, values)

        db.con.commit()
        return redirect('/criarconta')
    
    return render_template('formulario.html')

if __name__ == '__main__':
    app.run(host='192.168.88.90', port=5000)

