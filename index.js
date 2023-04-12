const app = require('./server');

const {
  PORT = 3000,
} = process.env;

const server = app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});

process.on('uncaughtException', err => {
  console.log(`Uncaught Exception: ${err.message}`)
  process.exit(1)
})

process.on('unhandledRejection', (reason, promise) => {
  // console.log('reasonObj', reason);
  console.log('Unhandled rejection at ', promise, `reason: ${reason.message}`)
  process.exit(1)
})

process.on('SIGINT', _ => {
  server.close(() => {
    process.exit(0)
  })
  // If server hasn't finished in 1000ms, shut down process
  setTimeout(() => {
    process.exit(0)
  }, 1000).unref() // Prevents the timeout from registering on event loop
})