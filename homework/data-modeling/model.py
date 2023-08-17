"""Models for Ubermelon Bites."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class StorageSpace(db.Model):
    """A storage space."""

    __tablename__ = "storage_spaces"

    storage_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    capacity = db.Column(db.Integer)
    melons = db.relationship("Melon", back_populates="storage_space")

    def __repr__(self):
        return f"<StorageSpace storage_id={self.storage_id} capacity={self.capacity}>"

class MelonType(db.Model):
    """A melon type."""

    __tablename__ = "melon_types"

    type_code = db.Column(db.String, primary_key=True)
    type_name = db.Column(db.String)
    max_slices = db.Column(db.Integer)
    melons = db.relationship("Melon", back_populates="melon_type")

    def __repr__(self):
        return f"<MelonType type_code={self.type_code} max_slices={self.max_slices}>"

class Melon(db.Model):
    """A melon."""

    __tablename__ = "melons"

    melon_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    type_code = db.Column(db.String, db.ForeignKey("melon_types.type_code"))
    arrived_at = db.Column(db.DateTime)
    storage_id = db.Column(db.Integer, db.ForeignKey("storage_spaces.storage_id"))
    slices_in = db.Column(db.Integer)

    melon_type = db.relationship("MelonType", back_populates="melons")
    storage_space = db.relationship("StorageSpace", back_populates="melons")
    slices = db.relationship("SliceOrder", back_populates="melon")

    def __repr__(self):
        return f"<Melon melon_id={self.melon_id} slices_in={self.slices_in}>"

class Customer(db.Model):
    """A customer."""

    __tablename__ = "customers"

    customer_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String)
    address = db.Column(db.String)
    phone = db.Column(db.String)
    orders = db.relationship("Order", back_populates="customer")

    def __repr__(self):
        return f"<Customer customer_id={self.customer_id} name={self.name}>"

class Order(db.Model):
    """An order."""

    __tablename__ = "orders"

    order_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    ordered_at = db.Column(db.DateTime)
    customer_id = db.Column(db.Integer, db.ForeignKey("customers.customer_id"))

    customer = db.relationship("Customer", back_populates="orders")
    slices = db.relationship("SliceOrder", back_populates="order")

    def __repr__(self):
        return f"<Order order_id={self.order_id} customer_id={self.customer_id}>"

class SliceOrder(db.Model):
    """An association table between Melons and Orders."""

    __tablename__ = "slices"

    slice_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    melon_id = db.Column(db.Integer, db.ForeignKey("melons.melon_id"))
    order_id = db.Column(db.Integer, db.ForeignKey("orders.order_id"))
    quantity = db.Column(db.Integer)

    melon = db.relationship("Melon", back_populates="slices")
    order = db.relationship("Order", back_populates="slices")

    def __repr__(self):
        return f"<SliceOrder slice_id={self.slice_id} quantity={self.quantity}"


def connect_to_db(flask_app, db_uri="postgresql:///ubermelon", echo=True):
    flask_app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
    flask_app.config["SQLALCHEMY_ECHO"] = echo
    flask_app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.app = flask_app
    db.init_app(flask_app)

    print("Connected to the db!")


if __name__ == "__main__":
    from server import app

    # Call connect_to_db(app, echo=False) if your program output gets
    # too annoying; this will tell SQLAlchemy not to print out every
    # query it executes.

    connect_to_db(app)
