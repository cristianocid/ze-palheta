import  psycopg2

def execute_p(query):

    conn =  psycopg2.connect(
        host='zepalheta-postgres',
        database='zepalheta',
        user='postgres',
        password='qaninja',
    )

    cur = conn.cursor()
    cur.execute(query)

    conn.commit()

    cur.close()
    conn.close()


def format_cpf(cpf):
    return cpf [:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]


def Insert_customer(name, cpf, address, phone):

    cpf_formatado = format_cpf(cpf)

    query = "insert into public.customers(name,cpf,address,phone_number) "\
	"values ('{}', '{}', '{}', '{}');".format(name, cpf_formatado, address, phone)
    
    execute_p(query)


def remove_customer_by_cpf(cpf):

    cpf_formatado = format_cpf(cpf)

    query = "delete from public.customers where cpf = '{}';".format(cpf_formatado)

    execute_p(query)