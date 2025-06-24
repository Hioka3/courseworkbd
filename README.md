![ER-диаграмма](https://github.com/user-attachments/assets/b8b09b73-7da9-4921-bd8d-3df0202c6461)

# База данных для БИБЛИОТЕКИ

## Оглавление
- [Типовые запросы](#типовые-запросы)
- [Представление](#представление)
- [Функция](#функция)
- [Триггер](#триггер)

---

## Типовые запросы

### Список категорий и количество книг в каждой

```sql
SELECT 
    c.name AS category_name,
    COUNT(bhc.Books_idBooks) AS book_count
FROM Categories c
LEFT JOIN Books_has_Categoriesbooks bhc 
    ON c.category_id = bhc.Categoriesbooks_idCategoriesbooks
GROUP BY c.category_id, c.name
ORDER BY book_count DESC;
```

### Книги, которые сейчас находятся в пользовании (не возвращены)

```sql
SELECT 
    b.title, 
    u.name AS borrowed_by, 
    br.borrow_date
FROM Borrowings br
JOIN Books b 
    ON br.Books_book_id = b.book_id
JOIN Users u 
    ON br.Users_user_id = u.user_id
WHERE br.return_date IS NULL;
```

### Пользователи, которые брали хотя бы одну книгу

```sql
SELECT 
    u.user_id, 
    u.name, 
    COUNT(br.borrow_id) AS borrow_count
FROM Users u
JOIN Borrowings br 
    ON u.user_id = br.Users_user_id
GROUP BY u.user_id;
```

---

## Представление

Создает виртуальную таблицу, которая объединяет данные о книгах и их авторах.

```sql
SELECT * FROM mydb.view_bookauthors;
```

---

## Функция

Показывает, к какой категории относится та или иная книга.

```sql
SELECT mydb.GetBookCategories(1);
```

---

## Триггер

Когда пользователь берет книгу в аренду, триггер автоматически записывает информацию об этом событии в BorrowLog.

```sql
INSERT INTO mydb.borrowings (
    borrow_date, 
    return_date, 
    Users_user_id, 
    Books_book_id
)
VALUES (
    NOW(), 
    DATE_ADD(NOW(), INTERVAL 7 DAY), 
    1, 
    1
);
```
