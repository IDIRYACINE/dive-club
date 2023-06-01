INSERT INTO
    Genders
VALUES
    (0, "H"),
    (1, "F");

INSERT INTO
    DivingDivisions
VALUES
    (0, "NAGE LIBRE"),
    (1, "NAGE DOS"),
    (2, "NAGE BRASSE"),
    (3, "NAGE PAPILLON");

INSERT INTO
    DivingSpecialties
VALUES
    (0, "50 M"),
    (1, "100 M"),
    (2, "200 M");

INSERT INTO
    AgeDivisions
VALUES
    (0, "Ecole"),
    (1, "Poussin");

INSERT INTO
    AgeDivisionsEntry
VALUES
    (2013, 0),
    (2014, 0),
    (2012, 0),
    (2015, 0),
    (2016, 0),
    (2017, 0),
    (2018, 1);

INSERT INTO
    Clubs
VALUES
    (0, "Club1"),
    (1, "CLUB 2");

INSERT INTO
    Participants (
        participant_first_name,
        participant_last_name,
        entry_time,
        birth_date,
        club_id,
        gender_id,
        division_id,
        specialty_id,
        age_division_year
    )
VALUES
    (
        "idir",
        "idir",
        "034521",
        1685491200,
        0,
        0,
        0,
        0,
        2013
    ),
    (
        "idir",
        "idir",
        "034531",
        1685491200,
        0,
        0,
        0,
        0,
        2013
    );