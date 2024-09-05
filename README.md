# AssemblyAI Tester

This tool allows you to test an AssemblyAI transcription by providing a URL and a valid
configuration object during the request.

There is also a command to retrieve the transcript after the async job has completed. You can
check the status of the async transcription job at https://www.assemblyai.com/app/processing-queue.

## Testing Steps

1. Find a video on YouTube
2. Use the [YouTube Video Downloader](https://www.submagic.co/tools/youtube-video-downloader) to generate a public link
3. Run the `transcribe <URL>` command using the URL generated in step 2
4. Run the `get-transcript <ID>` command to retrieve the transcript after the job is complete
