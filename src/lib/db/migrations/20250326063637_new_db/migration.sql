-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Timetable" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "lesson_code" TEXT NOT NULL,
    "weekdays" TEXT NOT NULL,
    "start_time" TEXT NOT NULL,
    "end_time" TEXT NOT NULL,
    "school_year" INTEGER NOT NULL,
    CONSTRAINT "Timetable_lesson_code_fkey" FOREIGN KEY ("lesson_code") REFERENCES "Lesson_list" ("lesson_code") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Timetable" ("end_time", "id", "lesson_code", "school_year", "start_time", "weekdays") SELECT "end_time", "id", "lesson_code", "school_year", "start_time", "weekdays" FROM "Timetable";
DROP TABLE "Timetable";
ALTER TABLE "new_Timetable" RENAME TO "Timetable";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
