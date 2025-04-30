import "schema.shalom.dart";
import 'dart:convert';
import "dart/shalom_core/"






class GetID{

    /// class members
    
        
            final String id;
        
    

    // keywordargs constructor
    GetID({
    required
        this.id,
    
    });
    static GetID fromJson(JsonObject data) {
    
        
            final String id_value = data['id'];
        
    
    return GetID(
    
        
        id: id_value,
    
    );
    }
    GetID updateWithJson(JsonObject data) {
    
        
            final String id_value;
            if (data.containsKey('id')) {
            id_value = data['id'];
            } else {
            id_value = id;
            }
        
    
    return GetID(
    
        
        id: id_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetID &&
    
        other.id == id 
    
    );
    }
    @override
    int get hashCode =>
    
        id.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'id':
            
                id
            
        ,
    
    };
    }


}

// ------------ OBJECT DEFINITIONS -------------





class RequestGetID extends Requestable {
    final GetID operation;
    final GetIDVariables variables;

    RequestGetID({
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
            StringopName: "GetID"
        );
    }
}


class GetIDVariables {
    

    GetIDVariables({
        
    });

    JsonObject toJson() {
        return {
              
        };
    } 
}
