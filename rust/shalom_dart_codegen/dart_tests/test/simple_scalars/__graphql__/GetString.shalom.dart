
import 'dart:convert';
import 'package:shalom_core/shalom_core.dart';






class GetString{

    /// class members
    
        
            final String string;
        
    

    // keywordargs constructor
    GetString({
    required
        this.string,
    
    });
    static GetString fromJson(JsonObject data) {
    
        
            final String string_value = data['string'];
        
    
    return GetString(
    
        
        string: string_value,
    
    );
    }
    GetString updateWithJson(JsonObject data) {
    
        
            final String string_value;
            if (data.containsKey('string')) {
            string_value = data['string'];
            } else {
            string_value = string;
            }
        
    
    return GetString(
    
        
        string: string_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetString &&
    
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


}

// ------------ OBJECT DEFINITIONS -------------



class RequestGetString extends Requestable {
    final GetString operation;
    final GetStringVariables variables;

    RequestGetString({
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
            StringopName: "GetString"
        );
    }
}


class GetStringVariables {
    

    GetStringVariables(
        
    );

    JsonObject toJson() {
        return {
              
        };
    } 
}
