
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
    GetStringOptional
 extends Requestable {

    /// class members
    
        
            final String? stringOptional;
        
    
    // keywordargs constructor
    
    GetStringOptional
({
    
        this.stringOptional,
    
    });
    static 
    GetStringOptional
 fromJson(JsonObject data) {
    
        
            final String? stringOptional_value = data['stringOptional'];
        
    
    return 
    GetStringOptional
(
    
        
        stringOptional: stringOptional_value,
    
    );
    }
    
    GetStringOptional
 updateWithJson(JsonObject data) {
    
        
            final String? stringOptional_value;
            if (data.containsKey('stringOptional')) {
            stringOptional_value = data['stringOptional'];
            } else {
            stringOptional_value = stringOptional;
            }
        
    
    return 
    GetStringOptional
(
    
        
        stringOptional: stringOptional_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetStringOptional
 &&
    
        other.stringOptional == stringOptional 
    
    );
    }
    @override
    int get hashCode =>
    
        stringOptional.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'stringOptional':
            
                stringOptional
            
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
            StringopName: "GetStringOptional"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




