package model.service.imp;

import model.bean.Product;
import model.ripository.ProductRipository;
import model.ripository.imp.ProductRipositoryImp;
import model.service.ProductService;

import java.util.List;

public class ProductServiceImp implements ProductService {

    ProductRipository productRipository= new ProductRipositoryImp();

    @Override
    public List<Product> findAll() {
        return this.productRipository.findAll();
    }

    @Override
    public Product findById(Integer id) {
        return this.productRipository.findById(id);
    }

    @Override
    public void save(Product product) {
        this.productRipository.save(product);
    }

    @Override
    public void update(int id, Product product) {
        this.productRipository.update(id,product);
    }

    @Override
    public void delete(int id) {
        this.productRipository.delete(id);
    }
}
