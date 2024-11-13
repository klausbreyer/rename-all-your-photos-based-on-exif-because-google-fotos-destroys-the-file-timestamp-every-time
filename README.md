# rename-all-your-photos-based-on-exif-because-google-fotos-destroys-the-file-timestamp

Ever batch download your precious memories from Google Photos, only to find that all the original file timestamps are now utterly meaningless? Fret not! This handy script will save you from the horrors of chronologically chaotic photo folders by renaming all your photos based on their EXIF data!

## What Does This Script Do?

This script renames `.jpg` and `.jpeg` image files in a specified folder based on their EXIF data, specifically the `DateTimeOriginal` field. The new filenames follow the format `YYYY-MM-DD_HH-MM-SS.jpg`, making it easy to sort and find photos by the exact moment they were taken. If a file with the new name already exists, a number is appended to avoid duplicates.

## Why Would You Ever Need This?

Because Google Photos (and some other platforms) love to strip away your file timestamps when you batch download. And unless you're a fan of filenames like `IMG_20230101_0001.jpg` that mean absolutely nothing, you'll want your photos sorted in a human-readable, chronological order.

## Prerequisites

This script requires `exiftool`, a powerful command-line utility for reading and writing EXIF metadata in image files. If you don't have it installed yet, you can easily do so:

### Install exiftool

- **For Debian/Ubuntu (Linux):**

  ```bash
  sudo apt-get install exiftool
  ```

- **For macOS (using Homebrew):**
  ```bash
  brew install exiftool
  ```

## How to Use This Script

1. **Download the script:**

   Save the script to a file named `rename_images.sh`.

2. **Make the script executable:**

   Run the following command to make the script executable:

   ```bash
   chmod +x rename_images.sh
   ```

3. **Run the script:**

   Use the script by providing the path to the folder containing the images as an argument:

   ```bash
   ./rename_images.sh /path/to/your/folder
   ```

   Replace `/path/to/your/folder` with the actual path to the folder containing the images you want to rename.

## Example Usage

If you have a folder `/home/user/photos` containing `.jpg` or `.jpeg` files, you would run:

```bash
./rename_images.sh /home/user/photos
```

This will rename all `.jpg` and `.jpeg` files in that folder based on their EXIF `DateTimeOriginal` information.

## Handling Duplicates

If a file with the new name already exists in the folder, the script will append a number to the filename (e.g., `YYYY-MM-DD_HH-MM-SS_1.jpg`, `YYYY-MM-DD_HH-MM-SS_2.jpg`, etc.) to prevent overwriting.

## Notes

- Files that do not contain `DateTimeOriginal` EXIF data will be skipped.
- Only `.jpg` and `.jpeg` files are processed. Other image formats are not affected (yet).

## Troubleshooting

- **No EXIF data found**: Ensure that your images contain EXIF `DateTimeOriginal` data. You can check this using `exiftool`:

  ```bash
  exiftool -DateTimeOriginal /path/to/image.jpg
  ```

- **Script not found**: Ensure that the script is in the current directory or provide the full path to the script.

## License

This script is open-source and available under the MIT License. Feel free to modify, share, or use it to save your sanity from the horrors of poorly named photo files.

## Contributions

Feel free to fork this repository, submit issues, or make pull requests. If you can come up with a more absurdly verbose name for the next version, I’m all ears!
