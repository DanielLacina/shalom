
import 'dart:convert';
import 'package:shalom_core/shalom_core.dart';






class GetStringOptional{

    /// class members
    
        
            final String? stringOptional;
        
    

    // keywordargs constructor
    GetStringOptional({
    
        this.stringOptional,
    
    });
    static GetStringOptional fromJson(JsonObject data) {
    
        
            final String? stringOptional_value = data['stringOptional'];
        
    
    return GetStringOptional(
    
        
        stringOptional: stringOptional_value,
    
    );
    }
    GetStringOptional updateWithJson(JsonObject data) {
    
        
            final String? stringOptional_value;
            if (data.containsKey('stringOptional')) {
            stringOptional_value = data['stringOptional'];
            } else {
            stringOptional_value = stringOptional;
            }
        
    
    return GetStringOptional(
    
        
        stringOptional: stringOptional_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetStringOptional &&
    
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


}

// ------------ OBJECT DEFINITIONS -------------





class RequestGetStringOptional extends Requestable {
    final GetStringOptional operation;
    final GetStringOptionalVariables variables;

    RequestGetStringOptional({
        required this.operation,  
        required this.variables
    });

    Request toRequest() {
        final jsonEncoder = JsonEncoder();
        String queryString = jsonEncoder.convert(operation.toJson()); 
        return Request(
            query: queryString, 
            variables: variables.toJson(), 
            opType: OperationType.Query, 
            StringopName: "GetStringOptional"
        );
    }
}


class GetStringOptionalVariables {
    

    GetStringOptionalVariables(
        
    );

    JsonObject toJson() {
        return {
              
        };
    } 
}
