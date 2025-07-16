import { render, screen } from '@testing-library/react';
import { describe, expect, test, vi } from 'vitest';
import Todo from './Todo';



describe('<Todo />', () => {
  test('A single todo can be viewed', () => {
    const deleteTodo = vi.fn();
    const completeTodo = vi.fn();
    const todo = {
      _id: '1',
      text: 'Add Test case',
      done: false,
    };

    render(
      <Todo todo={todo} deleteTodo={deleteTodo} completeTodo={completeTodo} />
    );

    expect(screen.getByText('Add Test case')).toBeDefined();
  });
});
