import "schema.shalom.dart";
import 'dart:convert';
import "dart/shalom_core/"






class GetFloat{

    /// class members
    
        
            final double float;
        
    

    // keywordargs constructor
    GetFloat({
    required
        this.float,
    
    });
    static GetFloat fromJson(JsonObject data) {
    
        
            final double float_value = data['float'];
        
    
    return GetFloat(
    
        
        float: float_value,
    
    );
    }
    GetFloat updateWithJson(JsonObject data) {
    
        
            final double float_value;
            if (data.containsKey('float')) {
            float_value = data['float'];
            } else {
            float_value = float;
            }
        
    
    return GetFloat(
    
        
        float: float_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetFloat &&
    
        other.float == float 
    
    );
    }
    @override
    int get hashCode =>
    
        float.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'float':
            
                float
            
        ,
    
    };
    }


}

// ------------ OBJECT DEFINITIONS -------------





class RequestGetFloat extends Requestable {
    final GetFloat operation;
    final GetFloatVariables variables;

    RequestGetFloat({
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
            StringopName: "GetFloat"
        );
    }
}


class GetFloatVariables {
    

    GetFloatVariables({
        
    });

    JsonObject toJson() {
        return {
              
        };
    } 
}
