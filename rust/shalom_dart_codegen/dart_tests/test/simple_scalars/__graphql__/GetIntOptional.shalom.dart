
import 'dart:convert';
import 'package:shalom_core/shalom_core.dart';






class GetIntOptional{

    /// class members
    
        
            final int? intOptional;
        
    

    // keywordargs constructor
    GetIntOptional({
    
        this.intOptional,
    
    });
    static GetIntOptional fromJson(JsonObject data) {
    
        
            final int? intOptional_value = data['intOptional'];
        
    
    return GetIntOptional(
    
        
        intOptional: intOptional_value,
    
    );
    }
    GetIntOptional updateWithJson(JsonObject data) {
    
        
            final int? intOptional_value;
            if (data.containsKey('intOptional')) {
            intOptional_value = data['intOptional'];
            } else {
            intOptional_value = intOptional;
            }
        
    
    return GetIntOptional(
    
        
        intOptional: intOptional_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetIntOptional &&
    
        other.intOptional == intOptional 
    
    );
    }
    @override
    int get hashCode =>
    
        intOptional.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'intOptional':
            
                intOptional
            
        ,
    
    };
    }


}

// ------------ OBJECT DEFINITIONS -------------



class RequestGetIntOptional extends Requestable {
    final GetIntOptional operation;
    final GetIntOptionalVariables variables;

    RequestGetIntOptional({
        required this.operation,  
        required this.variables,
    });

    Request toRequest() {
        final jsonEncoder = JsonEncoder();
        String queryString = jsonEncoder.convert(operation.toJson()); 
        return Request(
            query: queryString, 
            variables: variables.toJson(), 
            opType: OperationType.Query, 
            StringopName: "GetIntOptional"
        );
    }
}


class GetIntOptionalVariables {
    

    GetIntOptionalVariables(
        
    );

    JsonObject toJson() {
        return {
              
        };
    } 
}
