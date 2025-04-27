
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
    GetID
 extends Requestable {

    /// class members
    
        
            final String id;
        
    
    // keywordargs constructor
    
    GetID
({
    required
        this.id,
    
    });
    static 
    GetID
 fromJson(JsonObject data) {
    
        
            final String id_value = data['id'];
        
    
    return 
    GetID
(
    
        
        id: id_value,
    
    );
    }
    
    GetID
 updateWithJson(JsonObject data) {
    
        
            final String id_value;
            if (data.containsKey('id')) {
            id_value = data['id'];
            } else {
            id_value = id;
            }
        
    
    return 
    GetID
(
    
        
        id: id_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetID
 &&
    
        other.id == id 
    
    );
    }
    @override
    int get hashCode =>
    
        id.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'id':
            
                id
            
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
            StringopName: "GetID"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




