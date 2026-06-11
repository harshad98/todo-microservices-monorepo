import TodoForm  from "./TodoForm";
import TodoList from "./TodoList";

export default function TodoPage() {
  return (
    <div className="p-8">
      <TodoForm />
      <TodoList />
    </div>
  );
}