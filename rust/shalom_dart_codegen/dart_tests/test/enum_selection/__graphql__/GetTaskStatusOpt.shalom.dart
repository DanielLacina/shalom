
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
    GetTaskStatusOpt
 extends Requestable {

    /// class members
    
        
            final GetTaskStatusOpt_task task;
        
    
    // keywordargs constructor
    
    GetTaskStatusOpt
({
    required
        this.task,
    
    });
    static 
    GetTaskStatusOpt
 fromJson(JsonObject data) {
    
        
            final GetTaskStatusOpt_task task_value;
            
                task_value = GetTaskStatusOpt_task.fromJson(data['task']);            
            
        
    
    return 
    GetTaskStatusOpt
(
    
        
        task: task_value,
    
    );
    }
    
    GetTaskStatusOpt
 updateWithJson(JsonObject data) {
    
        
        final GetTaskStatusOpt_task task_value;
        if (data.containsKey('task')) {
            
                task_value = GetTaskStatusOpt_task.fromJson(data['task']);            
            
        } else {
            task_value = task;
        }
        
    
    return 
    GetTaskStatusOpt
(
    
        
        task: task_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is 
    GetTaskStatusOpt
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
            StringopName: "GetTaskStatusOpt"
        )
    }
}

// ------------ OBJECT DEFINITIONS -------------


    class GetTaskStatusOpt_task  {
        
    /// class members
    
        
            final String id;
        
    
        
            final String name;
        
    
        
            final Status? statusOpt;
        
    
    // keywordargs constructor
    GetTaskStatusOpt_task({
    required
        this.id,
    required
        this.name,
    
        this.statusOpt,
    
    });
    static GetTaskStatusOpt_task fromJson(JsonObject data) {
    
        
            final String id_value = data['id'];
        
    
        
            final String name_value = data['name'];
        
    
        
            
            final Status? statusOpt_value;
            
                final String? statusOpt$raw = data['statusOpt']; 
                if (statusOpt$raw != null) {
                    statusOpt_value = Status.fromString(statusOpt$raw);
                } else {
                    statusOpt_value = null;
                }
            
        
    
    return GetTaskStatusOpt_task(
    
        
        id: id_value,
    
        
        name: name_value,
    
        
        statusOpt: statusOpt_value,
    
    );
    }
    GetTaskStatusOpt_task updateWithJson(JsonObject data) {
    
        
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
        
    
        
            
            final Status? statusOpt_value;
            if (data.containsKey('statusOpt')) {
                
                    final String? statusOpt$raw = data['statusOpt']; 
                    if (statusOpt$raw != null) {
                        statusOpt_value = Status.fromString(statusOpt$raw);
                    } else {
                        statusOpt_value = null;
                    }
                
            } else {
                statusOpt_value = statusOpt;
            }
        
    
    return GetTaskStatusOpt_task(
    
        
        id: id_value,
    
        
        name: name_value,
    
        
        statusOpt: statusOpt_value,
    
    );
    }
    @override
    bool operator ==(Object other) {
    return identical(this, other) ||
    (other is GetTaskStatusOpt_task &&
    
        other.id == id &&
    
        other.name == name &&
    
        other.statusOpt == statusOpt 
    
    );
    }
    @override
    int get hashCode =>
    
        Object.hashAll([
        
            
            id,
        
            
            name,
        
            
            statusOpt,
        
        ]);
    
    JsonObject toJson() {
    return {
    
        
        'id':
            
                id
            
        ,
    
        
        'name':
            
                name
            
        ,
    
        
        'statusOpt':
            
                statusOpt?.name  
            
        ,
    
    };
    }


    }



