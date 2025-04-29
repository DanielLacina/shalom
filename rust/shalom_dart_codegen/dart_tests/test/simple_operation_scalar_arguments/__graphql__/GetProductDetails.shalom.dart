
import 'dart:convert';

enum OperationType {
    Query,
    Mutation,
    Subscription
};

class Request {
    final String query;
    final JsonObject variables;
    final OperationType opType;
    final String StringopName;

    Request ({
        required this.query,
        required this.variables,
        required this.opType,
        required this.StringopName
    });
    
}

class Response {
    final JsonObject data;
    final String opName;

    Response({
        required this.data,
        required this.opName
    });
} 

abstract class Requestable {
    Request toRequest();
}

abstract class Link {
    Future<Response> request(Request request)
}



typedef JsonObject = Map<String, dynamic>;
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types




class 
    GetProductDetails
 extends Requestable {

    /// class members
    
        
            final GetProductDetails_product? product;
        
    
    
    // keywordargs constructor
    
    GetProductDetails
({
    
        this.product,
    
    });
    static 
    GetProductDetails
 fromJson(JsonObject data) {
    
        
            final GetProductDetails_product? product_value;
            
                final JsonObject? product$raw = data['product']; 
                if (product$raw != null) {
                    product_value = GetProductDetails_product.fromJson(product$raw);
                } else {
                    product_value = null;
                }
            
        
    
    return 
    GetProductDetails
(
    
        
        product: product_value,
    
    );
    }
    
    GetProductDetails
 updateWithJson(JsonObject data) {
    
        
        final GetProductDetails_product? product_value;
        if (data.containsKey('product')) {
            
                final JsonObject? product$raw = data['product']; 
                if (product$raw != null) {
                    product_value = GetProductDetails_product.fromJson(product$raw);
                } else {
                    product_value = null;
                }
            
        } else {
            product_value = product;
        }
        
    
    return 
    GetProductDetails
(
    
        
        product: product_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetProductDetails
 &&
    
        other.product == product 
    
    );
    }
    @override
    int get hashCode =>
    
        product.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'product':
            
                product?.toJson()
            
        ,
    
    };
    }


    Request toRequest(JsonObject variables) {
        final jsonEncoder = JsonEncoder();
        String queryString = jsonEncoder.convert(toJson()); 
        Request(
            query: queryString, 
            variables: variables, 
            opType: OperationType.Query, 
            StringopName: "GetProductDetails"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------


    class GetProductDetails_product  {
        
    /// class members
    
        
            final String id;
        
    
        
            final String name;
        
    
        
            final double price;
        
    
        
            final double? discountedPrice;
        
    
    
    // keywordargs constructor
    GetProductDetails_product({
    required
        this.id,
    required
        this.name,
    required
        this.price,
    
        this.discountedPrice,
    
    });
    static GetProductDetails_product fromJson(JsonObject data) {
    
        
            final String id_value = data['id'];
        
    
        
            final String name_value = data['name'];
        
    
        
            final double price_value = data['price'];
        
    
        
            final double? discountedPrice_value = data['discountedPrice'];
        
    
    return GetProductDetails_product(
    
        
        id: id_value,
    
        
        name: name_value,
    
        
        price: price_value,
    
        
        discountedPrice: discountedPrice_value,
    
    );
    }
    GetProductDetails_product updateWithJson(JsonObject data) {
    
        
            final String id_value;
            if (data.containsKey('id')) {
            id_value = data['id'];
            } else {
            id_value = id;
            }
        
    
        
            final String name_value;
            if (data.containsKey('name')) {
            name_value = data['name'];
            } else {
            name_value = name;
            }
        
    
        
            final double price_value;
            if (data.containsKey('price')) {
            price_value = data['price'];
            } else {
            price_value = price;
            }
        
    
        
            final double? discountedPrice_value;
            if (data.containsKey('discountedPrice')) {
            discountedPrice_value = data['discountedPrice'];
            } else {
            discountedPrice_value = discountedPrice;
            }
        
    
    return GetProductDetails_product(
    
        
        id: id_value,
    
        
        name: name_value,
    
        
        price: price_value,
    
        
        discountedPrice: discountedPrice_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetProductDetails_product &&
    
        other.id == id &&
    
        other.name == name &&
    
        other.price == price &&
    
        other.discountedPrice == discountedPrice 
    
    );
    }
    @override
    int get hashCode =>
    
        Object.hashAll([
        
            
            id,
        
            
            name,
        
            
            price,
        
            
            discountedPrice,
        
        ]);
    
    JsonObject toJson() {
    return {
    
        
        'id':
            
                id
            
        ,
    
        
        'name':
            
                name
            
        ,
    
        
        'price':
            
                price
            
        ,
    
        
        'discountedPrice':
            
                discountedPrice
            
        ,
    
    };
    }


    }



