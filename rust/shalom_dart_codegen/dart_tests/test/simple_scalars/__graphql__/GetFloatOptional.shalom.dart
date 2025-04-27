
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
    GetFloatOptional
 extends Requestable {

    /// class members
    
        
            final double? floatOptional;
        
    
    // keywordargs constructor
    
    GetFloatOptional
({
    
        this.floatOptional,
    
    });
    static 
    GetFloatOptional
 fromJson(JsonObject data) {
    
        
            final double? floatOptional_value = data['floatOptional'];
        
    
    return 
    GetFloatOptional
(
    
        
        floatOptional: floatOptional_value,
    
    );
    }
    
    GetFloatOptional
 updateWithJson(JsonObject data) {
    
        
            final double? floatOptional_value;
            if (data.containsKey('floatOptional')) {
            floatOptional_value = data['floatOptional'];
            } else {
            floatOptional_value = floatOptional;
            }
        
    
    return 
    GetFloatOptional
(
    
        
        floatOptional: floatOptional_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetFloatOptional
 &&
    
        other.floatOptional == floatOptional 
    
    );
    }
    @override
    int get hashCode =>
    
        floatOptional.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'floatOptional':
            
                floatOptional
            
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
            StringopName: "GetFloatOptional"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




