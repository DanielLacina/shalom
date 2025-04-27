
import "schema.shalom.dart";

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
    GetTask
 extends Requestable {

    /// class members
    
        
            final GetTask_task task;
        
    
    // keywordargs constructor
    
    GetTask
({
    required
        this.task,
    
    });
    static 
    GetTask
 fromJson(JsonObject data) {
    
        
            final GetTask_task task_value;
            
                task_value = GetTask_task.fromJson(data['task']);            
            
        
    
    return 
    GetTask
(
    
        
        task: task_value,
    
    );
    }
    
    GetTask
 updateWithJson(JsonObject data) {
    
        
        final GetTask_task task_value;
        if (data.containsKey('task')) {
            
                task_value = GetTask_task.fromJson(data['task']);            
            
        } else {
            task_value = task;
        }
        
    
    return 
    GetTask
(
    
        
        task: task_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetTask
 &&
    
        other.task == task 
    
    );
    }
    @override
    int get hashCode =>
    
        task.hashCode;
    
    JsonObject toJson() {
    return {
    
        
        'task':
            
                task.toJson()
            
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
            StringopName: "GetTask"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------


    class GetTask_task  {
        
    /// class members
    
        
            final String id;
        
    
        
            final String name;
        
    
        
            final Status status;
        
    
    // keywordargs constructor
    GetTask_task({
    required
        this.id,
    required
        this.name,
    required
        this.status,
    
    });
    static GetTask_task fromJson(JsonObject data) {
    
        
            final String id_value = data['id'];
        
    
        
            final String name_value = data['name'];
        
    
        
            
            final Status status_value;
            
                status_value = Status.fromString(data['status']);            
            
        
    
    return GetTask_task(
    
        
        id: id_value,
    
        
        name: name_value,
    
        
        status: status_value,
    
    );
    }
    GetTask_task updateWithJson(JsonObject data) {
    
        
            final String id_value;
            if (data.containsKey('id')) {
            id_value = data['id'];
            } else {
            id_value = id;
            }
        
    
        
            final String name_value;
            if (data.containsKey('name')) {
            name_value = data['name'];
            } else {
            name_value = name;
            }
        
    
        
            
            final Status status_value;
            if (data.containsKey('status')) {
                
                    status_value = Status.fromString(data['status']);            
                
            } else {
                status_value = status;
            }
        
    
    return GetTask_task(
    
        
        id: id_value,
    
        
        name: name_value,
    
        
        status: status_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetTask_task &&
    
        other.id == id &&
    
        other.name == name &&
    
        other.status == status 
    
    );
    }
    @override
    int get hashCode =>
    
        Object.hashAll([
        
            
            id,
        
            
            name,
        
            
            status,
        
        ]);
    
    JsonObject toJson() {
    return {
    
        
        'id':
            
                id
            
        ,
    
        
        'name':
            
                name
            
        ,
    
        
        'status':
            
                status.name  
            
        ,
    
    };
    }


    }



