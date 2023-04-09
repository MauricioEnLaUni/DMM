"""Bus Populator
   Creates Bus items for the database.
"""
from sys import stdout
from datetime import datetime, timedelta
from random import randint
from wonderwords import RandomWord

class BusPopulator:
    """Creates a Bus item to populate the database."""
    or_stdout = stdout
    r = RandomWord()

    def to_file(self, x, y):
        """Writes output to file."""
        with open(x, "a", encoding="utf-8") as f:
            f.write(y)

    def get_address(self):
        """Generates an address."""
        cities = [
            ('Calvillo, Aguascalientes', 45),
            ('Monterrey, Nuevo León', 420),
            ('Guadalajara, Jalisco', 180),
            ('Cd. de México, Ciudad de México', 360),
            ('San Luis Potosí, San Luis Potosí', 140),
            ('San Juan de los Lagos, Jalisco', 65),
            ('Lagos de Moreno, Jalisco', 75),
            ('León, Guanajuato', 71),
            ('Zacatecas, Zacatecas', 93),
            ('Querétaro, Querétaro', 200),
            ('Morelia, Michoacán', 240),
            ('Puerto Vallarta, Jalisco', 440)
        ]

        temp = randint(0,11)
        return cities[temp]

    def get_date(self):
        """Creates a random date."""
        start = datetime.now()
        addition = randint(20, 4320)
        return start + timedelta(minutes=addition)


    def main(self):
        """Do the thing."""
        exits = randint(20, 35)
        entries = randint(20, 35)
        i = 0
        lux = randint(0, 1)
        seats = 65 if lux == 1 else 48
        out_time = self.get_date()
        address = self.get_address()
        ex = address[0].split(',')[0]
        output = f'INSERT INTO TRAVEL VALUES(NULL, "Aguascalientes - { ex }", "Aguascalientes, Aguascalientes", "{out_time}", "{address[0]}", "{out_time + timedelta(minutes=address[1])}", {seats}),\n'
        while i < exits:
            lux = randint(0, 1)
            seats = 65 if lux == 1 else 48
            out_time = self.get_date()
            address = self.get_address()
            ex = address[0].split(',')[0]
            output += f'(NULL, "Aguascalientes - { ex }", "Aguascalientes, Aguascalientes", "{out_time}", "{address[0]}", "{out_time + timedelta(minutes=address[1])}", {seats}),\n'
            i += 1
        i = 0
        while i < entries:
            lux = randint(0, 1)
            seats = 65 if lux == 1 else 48
            out_time = self.get_date()
            address = self.get_address()
            ex = address[0].split(',')[0]
            output += f'(NULL, "{ ex } - Aguascalientes", "{address[0]}", "{out_time}", "Aguascalientes, Aguascalientes", "{out_time + timedelta(minutes=address[1])}", {seats}),\n'
            i += 1
        output += ';'
        self.to_file('bus.txt', output)

def main():
    """Runs the program."""
    pop = BusPopulator()
    pop.main()

main()
