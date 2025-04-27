
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
    GetIDOptional
 extends Requestable {

    /// class members
    
        
            final String? idOptional;
        
    
    // keywordargs constructor
    
    GetIDOptional
({
    
        this.idOptional,
    
    });
    static 
    GetIDOptional
 fromJson(JsonObject data) {
    
        
            final String? idOptional_value = data['idOptional'];
        
    
    return 
    GetIDOptional
(
    
        
        idOptional: idOptional_value,
    
    );
    }
    
    GetIDOptional
 updateWithJson(JsonObject data) {
    
        
            final String? idOptional_value;
            if (data.containsKey('idOptional')) {
            idOptional_value = data['idOptional'];
            } else {
            idOptional_value = idOptional;
            }
        
    
    return 
    GetIDOptional
(
    
        
        idOptional: idOptional_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetIDOptional
 &&
    
        other.idOptional == idOptional 
    
    );
    }
    @override
    int get hashCode =>
    
        idOptional.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'idOptional':
            
                idOptional
            
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
            StringopName: "GetIDOptional"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------




