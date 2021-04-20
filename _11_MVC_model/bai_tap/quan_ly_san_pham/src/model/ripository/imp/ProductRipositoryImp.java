package model.ripository.imp;

import model.bean.Product;
import model.ripository.ProductRipository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRipositoryImp implements ProductRipository {
    private static Map<Integer, Product> mapProducts;

    static {
//            Integer id, String name, Double price, String describe, String producer


        mapProducts = new HashMap<>();

        mapProducts.put(1, new Product(1, "Iphone", 2000.0, "San pham cua Apple", "Apple"));
        mapProducts.put(2, new Product(2, "SamSung", 1500.0, "San pham cua Samsung", "Samsung"));
        mapProducts.put(3, new Product(3, "Nokia", 1000.0, "San pham cua Nokia", "Nokia"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(mapProducts.values());
    }

    @Override
    public Product findById(Integer id) {
        return mapProducts.get(id);
    }

    @Override
    public void save(Product product) {
        mapProducts.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        mapProducts.put(id, product);
    }

    @Override
    public void delete(int id) {
        mapProducts.remove(id);
    }


}
