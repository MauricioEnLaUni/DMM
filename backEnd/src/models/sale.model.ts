class SaleItem {
  id_bus: number;
  id_usr: number;
  seats: number;
  price: number;

  constructor(id_bus: number, id_usr: number, seats: number, price: number)
  {
    this.id_bus = id_bus;
    this.id_usr = id_usr;
    this.seats = seats;
    this.price = price;
  }
}

export default SaleItem;