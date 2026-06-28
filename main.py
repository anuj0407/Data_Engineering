from fastapi import FastAPI, Depends
from models import Product
from database import sessionlocal, engine
import database_models
from sqlalchemy.orm import session

app = FastAPI()

database_models.Base.metadata.create_all(bind=engine)

@app.get("/")
def greet():
    return "Welcome"

products = [
    Product(id = 1,name = 'Phone',description = 'Budget Phone',price = 9999,quantity = 10),
    Product(id = 2,name = 'Laptop',description = 'Gaming Laptop',price = 129999,quantity = 6),
    Product(id = 3,name = 'pen',description = 'Blue ink pen',price = 3.99,quantity = 100),
    Product(id = 4,name = 'Table',description = 'A wooden Table',price = 3999,quantity = 20)
]

# Connection
def get_db():
    db = sessionlocal()
    try:
        yield db
    finally:
        db.close()
    
def init_db():
    db = sessionlocal()
    count = db.query(database_models.Product).count()
    if count == 0:
        for product in products:
            db.add(database_models.Product(**product.model_dump()))
    
        db.commit()

init_db()    

@app.get("/products")
def get_all_products(db: session = Depends(get_db)):
    # Querry 
    db_products = db.query(database_models.Product).all()
    return db_products

@app.get("/product/{id}")
def get_product_by_id(id:int,db: session = Depends(get_db)):
    db_product = db.query(database_models.Product).filter(database_models.Product.id == id).first()
    if db_product:
        return db_product
    return 'Product Not found'
        
@app.post("/product")
def add_product(product: Product,db: session = Depends(get_db)):
    db.add(database_models.Product(**product.model_dump()))
    db.commit()
    return product

@app.put("/product/{id}")
def update_product(id:int, product: Product,db: session = Depends(get_db)):
    db_product = db.query(database_models.Product).filter(database_models.Product.id == id).first()
    if db_product:
        db_product.name = product.name
        db_product.desciption = product.description
        db_product.price = product.price
        db_product.quantity = product.quantity
        db.commit()
        return "Product updated"
    return "No Product found"

@app.delete("/product")
def delete_product(id: int,db: session = Depends(get_db)):
    db_product = db.query(database_models.Product).filter(database_models.Product.id == id).first()
    if db_product:
            db.delete(db_product)
            db.commit()
            return "Products Deleted"
        
    return "Product not found"