import json
import os

import assemblyai as aai
import typer
from assemblyai import SummarizationType, SummarizationModel

aai.settings.api_key = os.getenv("ASSEMBLY_AI_API_KEY")
app = typer.Typer()


@app.command()
def get_transcript(transcript_id: str, output_filename="output.json"):
    transcript = aai.Transcript.get_by_id(transcript_id)
    with open(output_filename, "w") as output_file:
        json.dump(transcript.json_response, output_file, indent=2)

    print(f"Downloaded transcript to {output_file.name}")


@app.command()
def transcribe(url: str):
    print("Transcribing media with the specified options...")

    transcriber = aai.Transcriber()

    config = aai.TranscriptionConfig(
        speaker_labels=True,
        auto_highlights=True,
        entity_detection=True,
        content_safety=True,
        filter_profanity=True,
        iab_categories=True,
        punctuate=True,
        sentiment_analysis=True,
        summarization=True,
        summary_type=SummarizationType.bullets,
        summary_model=SummarizationModel.informative,
    )

    transcript = transcriber.transcribe(url, config)

    print(f"Created transcript: {transcript.id}")


if __name__ == "__main__":
    app()
