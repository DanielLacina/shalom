
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
    GetMultipleFields
 extends Requestable {

    /// class members
    
        
            final String id;
        
    
        
            final int intField;
        
    
    // keywordargs constructor
    
    GetMultipleFields
({
    required
        this.id,
    required
        this.intField,
    
    });
    static 
    GetMultipleFields
 fromJson(JsonObject data) {
    
        
            final String id_value = data['id'];
        
    
        
            final int intField_value = data['intField'];
        
    
    return 
    GetMultipleFields
(
    
        
        id: id_value,
    
        
        intField: intField_value,
    
    );
    }
    
    GetMultipleFields
 updateWithJson(JsonObject data) {
    
        
            final String id_value;
            if (data.containsKey('id')) {
            id_value = data['id'];
            } else {
            id_value = id;
            }
        
    
        
            final int intField_value;
            if (data.containsKey('intField')) {
            intField_value = data['intField'];
            } else {
            intField_value = intField;
            }
        
    
    return 
    GetMultipleFields
(
    
        
        id: id_value,
    
        
        intField: intField_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetMultipleFields
 &&
    
        other.id == id &&
    
        other.intField == intField 
    
    );
    }
    @override
    int get hashCode =>
    
        Object.hashAll([
        
            
            id,
        
            
            intField,
        
        ]);
    
    JsonObject toJson() {
    return {
    
        
        'id':
            
                id
            
        ,
    
        
        'intField':
            
                intField
            
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
            StringopName: "GetMultipleFields"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




