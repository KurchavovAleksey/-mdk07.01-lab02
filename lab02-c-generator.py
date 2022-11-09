import random



def generate_mac():
    mac = [0x00, 0x16, 0x3e, random.randint(0x00, 0x7f), random.randint(0x00, 0xff), random.randint(0x00, 0xff)]
    return ':'.join(map(lambda x: "%02x" % x, mac))


SOFTWARE = ('Skype', 'The Bat', 'Visio 2016', 'Far Manager', 'HexChat')

NAMES = (
    'Егор', 'Анна', 'Аиша', 'Оливия', 'Артур', 'Анастасия', 'Максим', 
    'Михаил', 'Илья', 'Макар'
) 
SURNAMES = (
    'Ситников', 'Дроздова', 'Пономарева', 'Гришина', 'Егоров', 'Смирнова', 
    'Куприянов', 'Потапов', 'Филиппов', 'Марков'
)

MIDDLENAMES = (
    'Евгеньевич', 'Александровна', 'Данииловна', 'Ивановна', 'Дмитриевич', 
    'Лукинична', 'Максимович', 'Александрович', 'Сергеевич', 'Даниилович'
)

NOTES = (
    'Работает так себе', 'Замена в следующем году', 
    'Заберу себе, когда спишут', 'Как такое можно было вообще закупить',
    'Большая царапина сверху', 'Обновили в прошлом году'
)

def main():
    # rooms - 15
    data = 'insert into rooms (num) values ' + ', '.join(f'({room_num})' for room_num in random.sample(range(1, 50), 15)) + ';'
    print(data)

    # employees - 10
    q = 'insert into employees (name, surname, middle_name) values {};'
    data = list()
    for _ in range(0, 10):
        data.append('(' + ', '.join(f"'{random.choice(i)}'" for i in (NAMES, SURNAMES, MIDDLENAMES)) + ')')

    print(q.format(', '.join(data)))

    # software - 5
    q = 'insert into software (name, version) values {};'
    print(q.format(', '.join(f"('{soft}', {random.randint(1, 10)})" for soft in SOFTWARE)))

    # pcs - 30
    q = 'insert into pcs (employee_id, room_id, note, ip_addr, mac_addr) values {};'
    print(q.format(', '.join(f"({random.randint(1, 10)}, {random.randint(1, 15)}, '{random.choice(NOTES)}', '192.168.1.{random.randint(1, 254)}', '{generate_mac()}')" for _ in range(60))))

    # installs - 60
    q = 'insert into installs values {} ;'
    print(q.format(', '.join(f"({random.randint(1, 30)}, {random.randint(1, 5)})" for _ in range(0, 60))))

if __name__ == '__main__':
    main()
