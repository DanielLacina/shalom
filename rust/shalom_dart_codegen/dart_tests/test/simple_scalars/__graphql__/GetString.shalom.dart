
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
    GetString
 extends Requestable {

    /// class members
    
        
            final String string;
        
    
    // keywordargs constructor
    
    GetString
({
    required
        this.string,
    
    });
    static 
    GetString
 fromJson(JsonObject data) {
    
        
            final String string_value = data['string'];
        
    
    return 
    GetString
(
    
        
        string: string_value,
    
    );
    }
    
    GetString
 updateWithJson(JsonObject data) {
    
        
            final String string_value;
            if (data.containsKey('string')) {
            string_value = data['string'];
            } else {
            string_value = string;
            }
        
    
    return 
    GetString
(
    
        
        string: string_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetString
 &&
    
        other.string == string 
    
    );
    }
    @override
    int get hashCode =>
    
        string.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'string':
            
                string
            
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
            StringopName: "GetString"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




