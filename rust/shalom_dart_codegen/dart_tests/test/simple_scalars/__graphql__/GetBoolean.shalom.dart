
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
    GetBoolean
 extends Requestable {

    /// class members
    
        
            final bool boolean;
        
    
    // keywordargs constructor
    
    GetBoolean
({
    required
        this.boolean,
    
    });
    static 
    GetBoolean
 fromJson(JsonObject data) {
    
        
            final bool boolean_value = data['boolean'];
        
    
    return 
    GetBoolean
(
    
        
        boolean: boolean_value,
    
    );
    }
    
    GetBoolean
 updateWithJson(JsonObject data) {
    
        
            final bool boolean_value;
            if (data.containsKey('boolean')) {
            boolean_value = data['boolean'];
            } else {
            boolean_value = boolean;
            }
        
    
    return 
    GetBoolean
(
    
        
        boolean: boolean_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetBoolean
 &&
    
        other.boolean == boolean 
    
    );
    }
    @override
    int get hashCode =>
    
        boolean.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'boolean':
            
                boolean
            
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
            StringopName: "GetBoolean"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




