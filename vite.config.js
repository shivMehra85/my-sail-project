import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'], // Adjust based on your entry points
            buildDirectory: 'build', // Set the build directory as 'build'
        }),
    ],
    build: {
        outDir: 'public/build', // This tells Vite to output files to 'public/build'
    },
});

