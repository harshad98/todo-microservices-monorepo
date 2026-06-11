import api from "./axios";

export const getTodosApi = () => {
  return api.get("/todos");
};

export const createTodoApi = (todo: {
  title: string;
  description: string;
}) => {
  return api.post("/todos", todo);
};

export const deleteTodoApi = (id: number) => {
  return api.delete(`/todos/${id}`);
};