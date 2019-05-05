import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlObject {
  static HttpLink httplink =
      HttpLink(uri: 'https://hasuraflut.herokuapp.com/v1alpha1/graphql');
  static AuthLink authLink = AuthLink();
  static Link link = httplink as Link;
  ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(cache: InMemoryCache(), link: link));
}

GraphQlObject graphQlObject = new GraphQlObject();

String toogleIsCompletedMutation(result, index) {
  return ("""
    mutation ToggleTask{
      update_todo(where:{
        id:{_eq: ${result.data["todo"][index]["id"]}}},
        _set:{isCompleted: ${!result.data["todo"][index]["isCompleted"]}}) {
          returning {isCompleted}
        }
    }
  """);
}

String deleteTaskMutation(result, index) {
  return ("""
    mutation DeleteTask{
      delete_todo(where:{id:{_eq:${result.data["todo"][index]["id"]}}}) {
        returning {id}
      }
    }
  """);
}

String addTaskMutation(task) {
  return ("""
    mutation AddTask{
      insert_todo(objects:{isCompleted: false, task: "$task"}){
        returning {id}
      }
    }
  """);
}

String fetchQuery() {
  return ("""
    query TodoGet{
      todo{
        id
        isCompleted
        task
      }
    }
  """);
}
