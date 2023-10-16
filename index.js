const express = require("express");
const bodyParser = require("body-parser");
const multer = require("multer");
const mysql = require("mysql");
const path = require("path");
const cors = require("cors");
const stripe = require("stripe")(
  "sk_test_51N29LQHV5zgJG4s6CKlofe5VYVjWjkIxo3uSRPJ7ubyOboOdxYCb5VQSh7nco3m8rjHI0IpgPesjDMA3Xed7DjkS00HGs8cVR0"
);

const fs = require('fs');
const app = express();
const port = 3001;

app.use(cors());
app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "smartbakers",
});

db.connect(function (err) {
  if (err) {
    throw err;
  }
  console.log("Database connected");
});
app.post("/register", (req, res) => {
  const email = req.body.email;
  const checkEmailQuery = "SELECT * FROM `signup` WHERE email = ?";
  
  db.query(checkEmailQuery, [email], (err, result) => {
    if (err) {
      console.error("Error checking email registration:", err);
      return res.status(500).json({ message: "Internal server error" });
    }
    
    if (result.length > 0) {
      // Email is already registered
      return res.status(400).json({ message: "Email is already registered" });
    } else {
      // Email is not registered; proceed with registration
      const sql =
        "INSERT INTO `signup`(`name`, `email`, `phoneno`, `address`, `password`) VALUES (?,?,?,?,?)";
      const values = [
        req.body.name,
        req.body.email,
        req.body.phoneno,
        req.body.address,
        req.body.password,
      ];
      
      db.query(sql, values, (err) => {
        if (err) {
          console.error("Error registering user:", err);
          return res.status(500).json({ message: "Internal server error" });
        }
        
        return res.status(200).json({ message: "User registered successfully" });
      });
    }
  });
});

// user signin code start end point

// Active  user account start point
app.post("/activeUser", (req, res) => {
  const sql =
    "INSERT INTO `signup`(`name`, `email`, `phoneno`, `address`, `password`) VALUES (?,?,?,?,?)";
  const values = [
    req.body.name,
    req.body.email,
    req.body.phoneno,
    req.body.address,
    req.body.password,
  ];
  db.query(sql, [values], (err, data) => {
    if (err) {
      console.error("Error saving user data to database:", err);
      return res.status(500).json({ message: "Internal server error" });
    }
    console.log("User registered successfully");
    return res.status(200).json({ message: "User registered successfully" });
  });
});
// Active  user account end pointzz

// Login user account start point
app.post("/login", (req, res) => {
  const email = req.body.email;
  const password = req.body.password;
  db.query(
    "SELECT * FROM `signup` WHERE email = ? AND password = ?",
    [email, password],
    (err, result) => {
      if (err) {
        res.send({ err: err });
      }
      if (result.length > 0) {
        res.send(result);
      } else {
        res.send("Wrong username / password combination");
      }
    }
  );  
});
// Login user account end point

// get user account data start point
app.get("/register", (req, res) => {
  db.query("SELECT * FROM `signup` ", (err, result, fields) => {
    if (err) {
      throw err;
    } else {
      res.send(result);
    }
  });
});
// get  user account data end point
app.get("/attribute", (req, res) => {
  db.query("SELECT * FROM `attribute` ", (err, result, fields) => {
    if (err) {
      throw err;
    } else {
      res.send(result);
    }
  });
});
// forget password with backend code start point
app.post("/forgetPassword", (req, res) => {
  const email = req.body.email;
  db.query("SELECT * FROM signup WHERE email = ?", [email], (err, result) => {
    if (err) {
      res.send({ err: err });
    }
    if (result) {
      res.send(result);
    } else {
      res.send({ message: "Wrong email" });
    }
  });
});
// forget password with backend code end pont

// Delete user account start point
app.delete("/users/:id", (req, res) => {
  const id = req.params.id;

  // Delete user from the database
  db.query("DELETE FROM signup WHERE id = ?", [id], (error, results) => {
    if (error) {
      console.error(error);
      return res
        .status(500)
        .json({ success: false, message: "Failed to delete user account" });
    }

    if (results.affectedRows === 0) {
      return res
        .status(404)
        .json({ success: false, message: "User account not found" });
    }

    return res.json({
      success: true,
      message: "User account deleted successfully",
    });
  });
});
// Delete user account endpoint
/////
// Appprove user account start point
app.put("/users/:id/approve", (req, res) => {
  const userId = req.params.id;
  const sql = 'UPDATE signup SET status = "verified" WHERE id = ?';
  db.query(sql, [userId], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).json({ message: "An error occurred" });
    } else {
      res.status(200).json({ message: "User status updated to verified" });
    }
  });
});
///////////////admin add  user backend code start   /////////////////////////

app.post("/admin-use", (req, res) => {
  const sql =
    "INSERT INTO `admin_add_role`(`name`, `email`, `password`) VALUES (?,?,?)";
  const values = [req.body.name, req.body.email, req.body.password];

  db.query(sql, values, (err, result, data) => {
    if (err) {
      console.log(err);
    }
    console.log("Data add");
  });
});

///////////////admin add  user backend code start   /////////////////////////

/////

///////////////verify user table /////////////////////////
app.post("/verifyuser", (req, res) => {
  const sql =
    "INSERT INTO `verifyuser`(`id`, `name`, `email`, `phoneno`, `address`, `password`) VALUES (?,?,?,?,?,?)";
  const values = [
    req.body.id,
    req.body.name,
    req.body.email,
    req.body.phoneno,
    req.body.address,
    req.body.password,
  ];
  db.query(sql, [values], (err, data) => {
    if (err) {
      console.error("Error saving user data to database:", err);
      return res.status(500).json({ message: "Internal server error" });
    }
    console.log("User registered successfully");
    return res.status(201).json({ message: "User registered successfully" });
  });
});

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({ storage });
const storage1 = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'documents/'); // Save images in the 'documents' folder
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname); // Use the original file name
  },
});

const upload1 = multer({ storage: storage1 }); // Use 'storage' instead of 'storage1'

app.use(express.static('documents'));

// Handle POST request to /documentsimg
app.post('/documentsimg', upload1.single('file'), (req, res) => {
  // Image is saved in the 'documents' folder
  console.log('Image saved:', req.file);
  
  // Send a success response
  res.status(200).json({ message: 'Image uploaded successfully' });
});

  
app.post("/upload", upload.single("image"), (req, res) => {
  const { filename } = req.file;
  res.json({ imagePath: `${filename}` });
  console.log(req.file);
});

app.post("/documents", (req, res) => {
  const sql =
    "INSERT INTO `get_documents`(`user_id`, `user_email`, `user_documents_img`, `user_document_slect`)  VALUES (?,?,?,?)";
  const values = [
    req.body.user_id,
    req.body.user_email,
    req.body.user_documents_img,
    req.body.user_document_slect,
  ];
  db.query(sql, values, (err, data) => {
    if (err) {
      console.log(err);
    }
    console.log("data was add");
  });
});
app.get("/documents", (req, res) => {
  db.query("SELECT * FROM `get_documents` ", (err, result, fields) => {
    if (err) {
      throw err;
    } else {
      res.send(result);
    }
  });
});

app.post("/add-product", (req, res) => {
  const { name, price, sell_price, productStatus, stock, image_url } = req.body;
  const sql =
    "INSERT INTO `product`( `name`, `price`, `sell_price`, `productStatus`, `image_url`, `stock`, `description`) VALUES (?,?,?,?,?,?,?)";
  db.query(
    sql,
    [name, price, sell_price, productStatus, image_url, stock],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).json({ error: "Error adding Order." });
      } else {
        res.json({ message: "Product added successfully." });
      }
    }
  );
});
app.get("/add-product", (req, res) => {
  db.query("SELECT * FROM `product`  ", (err, result, fields) => {
    if (err) {
      throw err;
    } else {
      res.send(result);
    }
  });
});


app.post('/orders', (req, res) => {
  const {
    attribute_name,
    orderStatus,
    paymentStatus,
    product_image_url,
    product_price,
    products_name,
    quantity,
    user_email,
    user_id,
    user_location,
    user_name,
    user_phoneno
  } = req.body;

  const query = `
    INSERT INTO orderspage
    (attribute_name, orderStatus, paymentStatus, product_image_url, product_price, products_name, quantity, user_email, user_id, user_location, user_name, user_phoneno)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  const values = [
    attribute_name,
    orderStatus,
    paymentStatus,
    JSON.stringify(product_image_url),
    JSON.stringify(product_price),
    JSON.stringify(products_name),
    JSON.stringify(quantity),
    user_email,
    user_id,
    user_location,
    user_name,
    user_phoneno
  ];

  db.query(query, values, (err, results) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ message: 'Error inserting data' });
    } else {
      res.status(200).json({ message: 'Data inserted successfully' });
    }
  });
});


app.get("/order", (req, res) => {
  db.query("SELECT * FROM `orderspage`  ", (err, result, fields) => {
    if (err) {
      throw err;
    } else {
      res.send(result);
    }
  });
});

app.get("/", (req, res) => {
  res.send("Hello World1");
});

app.post("/updateData", (req, res) => {
  console.log(req.body.user_id);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

app.put("/updateOrderStatus", (req, res) => {
  const { user_id, orderStatus } = req.body;

  const updateQuery = `
 UPDATE orderspage
    SET orderStatus = ?
    WHERE user_id = ?
  `;

  db.query(updateQuery, [orderStatus, user_id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error updating order status" });
    }

    res.json({ message: "Order status updated successfully" });
  });
});

app.use("/uploads/", express.static("uploads"));
app.use("/uploads/", express.static("uploads"));



app.post("/payment-sheet", async (req, res) => {
  try {
    const { totalAmount } = req.body; // Extract the total amount from the request body
    // Use an existing Customer ID if this is a returning customer.
    const customer = await stripe.customers.create();
    const ephemeralKey = await stripe.ephemeralKeys.create(
      { customer: customer.id },
      { apiVersion: "2022-11-15" }
    );
    const paymentIntent = await stripe.paymentIntents.create({
      amount: totalAmount * 100, // Convert the total amount to the smallest currency unit (e.g., cents)
      currency: "eur",
      customer: customer.id,
      // In the latest version of the API, specifying the `automatic_payment_methods` parameter is optional because Stripe enables its functionality by default.
      automatic_payment_methods: {
        enabled: true,
      },
    });
    res.json({
      paymentIntent: paymentIntent.client_secret,
      ephemeralKey: ephemeralKey.secret,
      customer: customer.id,
      publishableKey:
        "pk_test_51N29LQHV5zgJG4s6oXgnWKNHfpetnIQl3uXpvQWjbZXtcDkX7D10NMW7Z8CTj8Q0E4wP63TojKJdMKR3JY7hmkyb00TfMEV9t6",
    });
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});