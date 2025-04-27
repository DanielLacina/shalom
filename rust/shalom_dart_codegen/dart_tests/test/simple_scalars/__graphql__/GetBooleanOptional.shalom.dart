
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
    GetBooleanOptional
 extends Requestable {

    /// class members
    
        
            final bool? booleanOptional;
        
    
    // keywordargs constructor
    
    GetBooleanOptional
({
    
        this.booleanOptional,
    
    });
    static 
    GetBooleanOptional
 fromJson(JsonObject data) {
    
        
            final bool? booleanOptional_value = data['booleanOptional'];
        
    
    return 
    GetBooleanOptional
(
    
        
        booleanOptional: booleanOptional_value,
    
    );
    }
    
    GetBooleanOptional
 updateWithJson(JsonObject data) {
    
        
            final bool? booleanOptional_value;
            if (data.containsKey('booleanOptional')) {
            booleanOptional_value = data['booleanOptional'];
            } else {
            booleanOptional_value = booleanOptional;
            }
        
    
    return 
    GetBooleanOptional
(
    
        
        booleanOptional: booleanOptional_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetBooleanOptional
 &&
    
        other.booleanOptional == booleanOptional 
    
    );
    }
    @override
    int get hashCode =>
    
        booleanOptional.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'booleanOptional':
            
                booleanOptional
            
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
            StringopName: "GetBooleanOptional"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




