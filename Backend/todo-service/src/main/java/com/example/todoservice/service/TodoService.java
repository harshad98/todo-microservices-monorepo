package com.example.todoservice.service;

import lombok.RequiredArgsConstructor;
import com.example.todoservice.dto.TodoRequest;
import com.example.todoservice.entity.Todo;
import com.example.todoservice.repository.TodoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TodoService {

    private final TodoRepository todoRepository;

    public Todo createTodo(TodoRequest request) {

        Todo todo = Todo.builder()
                .title(request.getTitle())
                .description(request.getDescription())
                .completed(false)
                .userId(request.getUserId())
                .build();

        return todoRepository.save(todo);
    }

    public List<Todo> getTodosByUser(Long userId) {
        return todoRepository.findByUserId(userId);
    }

    public void deleteTodo(Long id) {
        todoRepository.deleteById(id);
    }
}