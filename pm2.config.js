module.exports = {
    apps: [
        {
            name: "server",
            script: "npm start",
            exec_mode: process.env.PM2_EXEC_MODE || "fork",
            instances: process.env.PM2_INSTANCES || 1,
            ignore_watch: ["node_modules"],
            shutdown_with_message: true,
            autorestart: true,
            env: {
                NODE_ENV: process.env.NODE_ENV || "development",
                SERVICE_VERSION: "1.1.3"
            },
        },
    ],
};
