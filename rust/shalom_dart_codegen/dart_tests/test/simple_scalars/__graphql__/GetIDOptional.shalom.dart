
import 'dart:convert';
import 'package:shalom_core/shalom_core.dart';






class GetIDOptional{

    /// class members
    
        
            final String? idOptional;
        
    

    // keywordargs constructor
    GetIDOptional({
    
        this.idOptional,
    
    });
    static GetIDOptional fromJson(JsonObject data) {
    
        
            final String? idOptional_value = data['idOptional'];
        
    
    return GetIDOptional(
    
        
        idOptional: idOptional_value,
    
    );
    }
    GetIDOptional updateWithJson(JsonObject data) {
    
        
            final String? idOptional_value;
            if (data.containsKey('idOptional')) {
            idOptional_value = data['idOptional'];
            } else {
            idOptional_value = idOptional;
            }
        
    
    return GetIDOptional(
    
        
        idOptional: idOptional_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetIDOptional &&
    
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


}

// ------------ OBJECT DEFINITIONS -------------



class RequestGetIDOptional extends Requestable {
    final GetIDOptional operation;
    final GetIDOptionalVariables variables;

    RequestGetIDOptional({
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
            StringopName: "GetIDOptional"
        );
    }
}


class GetIDOptionalVariables {
    

    GetIDOptionalVariables(
        
    );

    JsonObject toJson() {
        return {
              
        };
    } 
}
