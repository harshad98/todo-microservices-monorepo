package com.example.todoservice.controller;

import lombok.RequiredArgsConstructor;
import com.example.todoservice.entity.Todo;
import com.example.todoservice.repository.TodoRepository;
import com.example.todoservice.security.JwtService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/todos")
@RequiredArgsConstructor
public class TodoController {

    private final TodoRepository todoRepository;
    private final JwtService jwtService;

    @PostMapping
    public Todo createTodo(
            @RequestHeader("Authorization")
            String authHeader,
            @RequestBody Todo todo) {

        String token =
                authHeader.replace(
                        "Bearer ", "");

        Long userId =
                jwtService.extractUserId(token);

        todo.setUserId(userId);
        // ADD THIS LINE
        todo.setCompleted(false);

        return todoRepository.save(todo);
    }

    @GetMapping
    public List<Todo> getMyTodos(
            @RequestHeader("Authorization")
            String authHeader) {

        String token =
                authHeader.replace(
                        "Bearer ", "");

        Long userId =
                jwtService.extractUserId(token);

        return todoRepository.findByUserId(userId);
    }

    @DeleteMapping("/{id}")
    public String deleteTodo(
            @PathVariable Long id,
            @RequestHeader("Authorization")
            String authHeader) {

        String token =
                authHeader.replace(
                        "Bearer ", "");

        Long userId =
                jwtService.extractUserId(token);

        Todo todo = todoRepository
                .findByIdAndUserId(id, userId)
                .orElseThrow(() ->
                        new RuntimeException(
                                "Todo not found"));

        todoRepository.delete(todo);

        return "Todo Deleted Successfully";
    }
}