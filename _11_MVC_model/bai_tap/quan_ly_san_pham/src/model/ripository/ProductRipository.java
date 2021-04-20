package model.ripository;

import model.bean.Product;

import java.util.List;

public interface ProductRipository {
    List<Product> findAll();

    Product findById(Integer id);

    void save(Product product);

    void update(int id, Product product);

    void delete(int id);
}
