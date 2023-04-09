"""Seat populator"""
from sys import stdout

class SeatPopulator:
    """Creates a seat item for the database."""
    or_stdout = stdout

    def to_file(self, x, y):
        """Writes output to file."""
        with open(x, "a", encoding="utf-8") as f:
            f.write(y)

    def main(self):
        """Generates the data."""
        forty_eight_seaters = [1,2,4,5,11,12,13,18,22,27,28,32,33,35,38,39,43,48,45,49,51,52,54]
        output = 'INSERT INTO `seats` VALUES'
        for x in range (1, 57):
            if x in forty_eight_seaters:
                for y in range (1, 49):
                    output += f'({y}, {x}, FALSE),\n'
            else:
                for y in range (1, 66):
                    output += f'({y}, {x}, FALSE),\n'
        output = output[:-2]
        output += ';'
        self.to_file('seat.txt', output)

def main():
    """Driver function"""
    pop = SeatPopulator()
    pop.main()

main()
