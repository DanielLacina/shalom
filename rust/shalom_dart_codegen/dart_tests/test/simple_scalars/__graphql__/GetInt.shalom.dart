
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
    GetInt
 extends Requestable {

    /// class members
    
        
            final int intField;
        
    
    // keywordargs constructor
    
    GetInt
({
    required
        this.intField,
    
    });
    static 
    GetInt
 fromJson(JsonObject data) {
    
        
            final int intField_value = data['intField'];
        
    
    return 
    GetInt
(
    
        
        intField: intField_value,
    
    );
    }
    
    GetInt
 updateWithJson(JsonObject data) {
    
        
            final int intField_value;
            if (data.containsKey('intField')) {
            intField_value = data['intField'];
            } else {
            intField_value = intField;
            }
        
    
    return 
    GetInt
(
    
        
        intField: intField_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetInt
 &&
    
        other.intField == intField 
    
    );
    }
    @override
    int get hashCode =>
    
        intField.hashCode;
    
    JsonObject toJson() {
    return {
    
        
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
            StringopName: "GetInt"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




