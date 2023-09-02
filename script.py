import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('church_database.db')
cursor = conn.cursor()

# Define a function to convert a visitor to a member
def convert_visitor_to_member(visitor_id):
    try:
        # Get visitor information
        cursor.execute("SELECT * FROM Visitors WHERE visitor_id=?", (visitor_id,))
        visitor_data = cursor.fetchone()

        if visitor_data:
            # Insert the visitor as a new member
            cursor.execute("INSERT INTO Members (first_name, last_name, gender, date_of_birth, phone_number, email, date_joined) VALUES (?, ?, ?, ?, ?, ?, ?)",
                           (visitor_data[1], visitor_data[2], visitor_data[3], visitor_data[4], visitor_data[5], visitor_data[6], '2023-09-02'))

            # Update the visitor record to mark them as a member
            cursor.execute("UPDATE Visitors SET is_member=1 WHERE visitor_id=?", (visitor_id,))

            # Commit the changes to the database
            conn.commit()
            print("Visitor converted to member successfully.")
        else:
            print("Visitor not found.")

    except sqlite3.Error as e:
        print("Error:", e)

# Example usage: Convert visitor with ID 1 to a member
convert_visitor_to_member(1)

# Close the database connection
conn.close()
