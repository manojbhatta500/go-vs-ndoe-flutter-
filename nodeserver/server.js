const express = require("express");
const app = express();

app.get("/node", (req, res) => {
  const startTime = Date.now();

  // Simulate heavy processing
  let sum = 0;
  for (let i = 0; i < 1000000; i++) {
    sum = sum + i;
  }

  const endTime = Date.now();
  const processingTime = endTime - startTime;


  console.log("totla value",sum);

  res.json({
    "message": "Hello from Node Server",
    "processingTime": processingTime + "ms"
  });
});

const PORT = 3000;

app.listen(PORT, () => {
  console.log(`Node.js server is running on port ${PORT}`);
});
