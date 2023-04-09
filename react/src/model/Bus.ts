class Bus {
  id: number;
  name: string;
  home: string;
  departure: Date;
  destination: string;
  arrival: Date;
  seats: number;

  constructor(id: number, name: string, home: string, departure: Date, destination: string, arrival: Date, seats: number)
  {
    this.id = id;
    this.name = name;
    this.home = home;
    this.departure = departure;
    this.destination = destination;
    this.arrival = arrival;
    this.seats = seats;
  }
}