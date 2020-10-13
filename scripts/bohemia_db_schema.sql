-- TODO review non nullable fields,
-- inspect full dataframe labels,
-- whats with the repeat_id and repeat_counts?,
-- what is the lgl type ideal to match in sql? currently using BOOLEAN.

-- CREATE DATABASE bohemia;
-- NOTE switch to the bohemia database before proceeding with the following queries execution.
-- psql command `\c bohemia`
-- on ubuntu: export PGPASSWORD='riscrazy'; psql -h 'localhost' -U 'bohemia_app' -d 'bohemia'

CREATE TABLE minicensus_main (
    instance_id   uuid,
    any_deaths_past_year   VARCHAR(16),
    cook_main_water_source   VARCHAR(64),
    cook_time_to_water   VARCHAR(64),
    device_id   VARCHAR(64),
    end_time   TIMESTAMP,
    have_wid   VARCHAR(64),
    hh_sub_size   INT,
    hh_animals_distance_cattle_dry_season   VARCHAR(256),
    hh_animals_distance_cattle_dry_season_geo   VARCHAR(256),
    hh_animals_distance_cattle_rainy_season   VARCHAR(256),
    hh_animals_distance_cattle_rainy_season_geo   VARCHAR(256),
    hh_animals_distance_cattle_sleep   VARCHAR(256),
    hh_animals_dry_season_distance_pigs   VARCHAR(256),
    hh_animals_dry_season_geo_pigs   VARCHAR(256),
    hh_animals_dry_season_pigs   VARCHAR(256),
    hh_animals_rainy_season_distance_pigs   VARCHAR(256),
    hh_animals_rainy_season_geo_pigs   VARCHAR(256),
    hh_animals_rainy_season_pigs   VARCHAR(256),
    hh_animals_where_cattle_dry_season   VARCHAR(256),
    hh_animals_where_cattle_rainy_season   VARCHAR(256),
    hh_contact_info_number   TEXT,
    hh_contact_info_number_alternate   TEXT,
    hh_contact_info_number_can_call   VARCHAR(64),
    hh_country   VARCHAR(64),
    hh_district   VARCHAR(64),
    hh_geo_location   VARCHAR(256),
    hh_hamlet   VARCHAR(64),
    hh_hamlet_code   VARCHAR(3),
    hh_have_paint_house   VARCHAR(64),
    hh_have_paint_worker   VARCHAR(64),
    hh_head_dob   DATE,
    hh_head_gender   VARCHAR(8),
    hh_head_id   VARCHAR(12),
    hh_head_months_away   INT,
    hh_health_other   VARCHAR(256),
    hh_health_permission   VARCHAR(256),
    hh_health_who   VARCHAR(256),
    hh_health_who_other   VARCHAR(256),
    hh_id   VARCHAR(8), 
    hh_main_building_type   VARCHAR(256),
    hh_main_energy_source_for_lighting   VARCHAR(256),
    hh_main_wall_material   VARCHAR(256),
    hh_member_num   INT,
    hh_member_num_non_residents   INT,
    hh_member_num_residents   INT,
    hh_n_constructions   INT,
    hh_n_constructions_sleep   INT,
    hh_n_cows_greater_than_1_year   INT,
    hh_n_cows_less_than_1_year   INT,
    hh_n_pigs_greater_than_6_weeks   INT,
    hh_n_pigs_less_than_6_weeks   INT,
    hh_owns_cattle_or_pigs   VARCHAR(16),
    hh_photograph   VARCHAR(256),
    hh_possessions   VARCHAR(256),
    hh_region   VARCHAR(64),
    hh_size   INT,
    hh_village   VARCHAR(64),
    hh_ward   VARCHAR(64),
    how_many_deaths   INT,
    instanceName   VARCHAR(256),
    irs_past_12_months   VARCHAR(256),
    n_nets_in_hh   INT,
    respondent_id   VARCHAR(256),
    start_time   TIMESTAMP,
    todays_date   DATE,
    water_bodies   VARCHAR(256),
    water_bodies_how_many   INT,
    wid   INT,
    wid_manual   VARCHAR(32),
    wid_qr   VARCHAR(32),
    PRIMARY KEY(instance_id)
);

CREATE TABLE minicensus_people (
    instance_id    uuid,
    first_name   VARCHAR(256),
    last_name   VARCHAR(256),
    pid   VARCHAR(12),
    --name_label   VARCHAR(128),
    num  INT,
    dob DATE,
    dob_type   TEXT,
    gender    VARCHAR(8),
    hh_member_adjustment  INT,
    hh_member_number  INT,
    member_resident   VARCHAR(32),
    non_default_id    TEXT,
    note_id   BOOLEAN,
    permid    TEXT,
    repeat_household_members_enumeration_count    INT,
    trigger_non_default_id    TEXT,
    CONSTRAINT fk_minicensus_main FOREIGN KEY (instance_id) REFERENCES minicensus_main(instance_id) ON DELETE CASCADE
);

CREATE TABLE minicensus_repeat_death_info (
--   repeat_name <chr> - # table name
--   repeated_id <dbl> - # used to associate data for a single row
    instance_id    uuid,
    age_death     INT,
    death_age     INT,
    death_age_unit    VARCHAR(32),
    death_dob     DATE,
    death_dob_known   VARCHAR(16),
    death_dob_unknown     INT,
    death_dod     DATE,
    death_dod_known   VARCHAR(16),
    death_gender  VARCHAR(8),
    death_id  TEXT,
    death_location    VARCHAR(128),
    death_location_location   VARCHAR(128),
    death_name    VARCHAR(256),
    death_number  INT,
    death_number_size     VARCHAR(64),
    death_surname     VARCHAR(64),
    non_default_death_id  TEXT,
    note_death_id     TEXT,
    repeat_death_info_count   INT,
    trigger_non_default_death_id   VARCHAR(16),
    CONSTRAINT fk_minicensus_main FOREIGN KEY (instance_id) REFERENCES minicensus_main(instance_id) ON DELETE CASCADE
);

CREATE TABLE minicensus_repeat_hh_sub (
--   repeat_name <chr> - # table name
--   repeated_id <dbl> - # used to associate data for a single row
    instance_id    uuid,
    hh_sub_count  INT,
    hh_sub_dob    DATE,
    hh_sub_gender     VARCHAR(8),
    hh_sub_id     INT,
    hh_sub_relationship   VARCHAR(128),
    CONSTRAINT fk_minicensus_main FOREIGN KEY (instance_id) REFERENCES minicensus_main(instance_id) ON DELETE CASCADE
);

CREATE TABLE minicensus_repeat_mosquito_net (
--   repeat_name <chr> - # table name
--   repeated_id <dbl> - # used to associate data for a single row
    instance_id    uuid,
    net_obtain_when   TEXT,
    num   INT,
    CONSTRAINT fk_minicensus_main FOREIGN KEY (instance_id) REFERENCES minicensus_main(instance_id) ON DELETE CASCADE
);

CREATE TABLE minicensus_repeat_water (
--   repeat_name <chr> - # table name
--   repeated_id <dbl> - # used to associate data for a single row
    instance_id    uuid,
    num  INT,
    water_bodies_type  TEXT,
    CONSTRAINT fk_minicensus_main FOREIGN KEY (instance_id) REFERENCES minicensus_main(instance_id) on delete CASCADE
);

-- Enumerations

CREATE TABLE enumerations (
    instance_id   uuid,
    agregado   VARCHAR(256),
    chefe_name   VARCHAR(128),
    construction_material   VARCHAR(256),
    construction_type   VARCHAR(256),
    country   VARCHAR(32),
    device_id   VARCHAR(64),
    district   VARCHAR(32),
    end_time   TIMESTAMP,
    hamlet   VARCHAR(128),
    hamlet_code   VARCHAR(3),
    have_wid   VARCHAR(64),
    inquiry_date   Date,
    localizacao_agregado   VARCHAR(256),
    location_gps   VARCHAR(256),
    n_deaths_past_year   INT,
    n_residents   INT,
    n_total_constructions   INT,
    region   VARCHAR(64),
    start_time   TIMESTAMP,
    sub_name   VARCHAR(256),
    todays_date   DATE,
    village   VARCHAR(256),
    vizinho1   VARCHAR(256),
    vizinho2   VARCHAR(256),
    wall_material   VARCHAR(256),
    --wall_material_free   VARCHAR(256),
    ward   VARCHAR(256),
    wid   INT,
    wid_manual   VARCHAR(32),
    wid_qr   VARCHAR(32),
    PRIMARY KEY(instance_id)
);

-- Refusals


CREATE TABLE refusals (
    instance_id   uuid,
    device_id   VARCHAR(64),
    end_time   TIMESTAMP,
    have_wid   VARCHAR(64),
    country   VARCHAR(32),
    hh_geo_location   VARCHAR(256),
    hamlet   VARCHAR(128),
    district   VARCHAR(64),
    region   VARCHAR(64),
    hamlet_code   VARCHAR(3),
    hh_id   VARCHAR(8),
    hh_id_manual   VARCHAR(8),
    hh_region   VARCHAR(32),
    village   VARCHAR(32),
    ward   VARCHAR(32),
    instancename   VARCHAR(64),
    reason_no_participate   TEXT,
    start_time   TIMESTAMP,
    todays_date   DATE,
    wid   INT,
    wid_manual   VARCHAR(32),
    wid_qr   VARCHAR(32),
    PRIMARY KEY(instance_id)
    );

-- Sessions

CREATE TABLE sessions (
    user_email  VARCHAR(256),
    start_time  TIMESTAMP NOT NULL,
    end_time    TIMESTAMP
);


-- Corrections


CREATE TABLE corrections (
    id  TEXT,
    action  TEXT,
    submitted_by   VARCHAR(128),
    submitted_at   TIMESTAMP,
    done    BOOLEAN DEFAULT false,
    done_by     VARCHAR(128)
);



-- VA 153

CREATE TABLE va (
  instance_id   uuid,
  device_id   VARCHAR(64),
  end_time   TIMESTAMP,
  have_wid   VARCHAR(64),
  start_time   TIMESTAMP,
  todays_date   DATE,
  wid   INT,
  wid_manual   VARCHAR(32),
  wid_qr   VARCHAR(32),
  age_adult   TEXT,
  age_child_days   TEXT,
  age_child_months   TEXT,
  age_child_unit   TEXT,
  age_child_years   TEXT,
  age_group   TEXT,
  age_neonate_days   TEXT,
  ageindays   TEXT,
  ageindays2   TEXT,
  ageindaysneonate   TEXT,
  ageinmonths   TEXT,
  ageinmonthsbyyear   TEXT,
  ageinmonthsremain   TEXT,
  ageinyears   TEXT,
  ageinyears2   TEXT,
  ageinyearsremain   TEXT,
  comment   TEXT,
  d2sn   TEXT,
  death_id   TEXT,
  gps_details   TEXT,
  gps_location   TEXT,
  have_paint   TEXT,
  hh_id   TEXT,
  id_manual   TEXT,
  id10002   TEXT,
  id10003   TEXT,
  id10004   TEXT,
  id10007   TEXT,
  id10007a   TEXT,
  id10007b   TEXT,
  id10008   TEXT,
  id10009   TEXT,
  id10010   TEXT,
  id10010_phone   TEXT,
  id10010a   TEXT,
  id10010b   TEXT,
  id10010c   TEXT,
  id10011   TEXT,
  id10012   TEXT,
  id10013   TEXT,
  id10017   TEXT,
  id10018   TEXT,
  id10018_id   TEXT,
  id10019   TEXT,
  id10020   TEXT,
  id10021   TEXT,
  id10022   TEXT,
  id10023   TEXT,
  id10023_a   TEXT,
  id10023_b   TEXT,
  id10024   TEXT,
  id10051   TEXT,
  id10052   TEXT,
  id10053   TEXT,
  id10054_born_outside   TEXT,
  id10054d   TEXT,
  id10054r   TEXT,
  id10054v   TEXT,
  id10055   TEXT,
  id10055b   TEXT,
  id10057   TEXT,
  id10057_death_outside   TEXT,
  id10057d   TEXT,
  id10057r   TEXT,
  id10057v   TEXT,
  id10058   TEXT,
  id10058_other   TEXT,
  id10058b   TEXT,
  id10058c   TEXT,
  id10059   TEXT,
  id10060   TEXT,
  id10060_check   TEXT,
  id10061   TEXT,
  id10062   TEXT,
  id10063   TEXT,
  id10064   TEXT,
  id10065   TEXT,
  id10066   TEXT,
  id10069   TEXT,
  id10069_a   TEXT,
  id10070   TEXT,
  id10071   TEXT,
  id10071_check   TEXT,
  id10072   TEXT,
  id10073   TEXT,
  id10077   TEXT,
  id10079   TEXT,
  id10080   TEXT,
  id10081   TEXT,
  id10082   TEXT,
  id10083   TEXT,
  id10084   TEXT,
  id10085   TEXT,
  id10086   TEXT,
  id10087   TEXT,
  id10088   TEXT,
  id10089   TEXT,
  id10090   TEXT,
  id10091   TEXT,
  id10092   TEXT,
  id10093   TEXT,
  id10094   TEXT,
  id10095   TEXT,
  id10096   TEXT,
  id10097   TEXT,
  id10098   TEXT,
  id10099   TEXT,
  id10100   TEXT,
  id10104   TEXT,
  id10105   TEXT,
  id10106   TEXT,
  id10107   TEXT,
  id10108   TEXT,
  id10109   TEXT,
  id10110   TEXT,
  id10111   TEXT,
  id10112   TEXT,
  id10113   TEXT,
  id10114   TEXT,
  id10115   TEXT,
  id10116   TEXT,
  id10120   TEXT,
  id10120_0   TEXT,
  id10120_1   TEXT,
  id10120_unit   TEXT,
  id10121   TEXT,
  id10122   TEXT,
  id10123   TEXT,
  id10125   TEXT,
  id10126   TEXT,
  id10127   TEXT,
  id10128   TEXT,
  id10129   TEXT,
  id10130   TEXT,
  id10131   TEXT,
  id10132   TEXT,
  id10133   TEXT,
  id10134   TEXT,
  id10135   TEXT,
  id10136   TEXT,
  id10137   TEXT,
  id10138   TEXT,
  id10139   TEXT,
  id10140   TEXT,
  id10141   TEXT,
  id10142   TEXT,
  id10143   TEXT,
  id10144   TEXT,
  id10147   TEXT,
  id10148   TEXT,
  id10148_a   TEXT,
  id10148_b   TEXT,
  id10148_c   TEXT,
  id10148_units   TEXT,
  id10149   TEXT,
  id10150   TEXT,
  id10151   TEXT,
  id10152   TEXT,
  id10153   TEXT,
  id10154   TEXT,
  id10154_a   TEXT,
  id10154_b   TEXT,
  id10154_units   TEXT,
  id10155   TEXT,
  id10156   TEXT,
  id10157   TEXT,
  id10158   TEXT,
  id10159   TEXT,
  id10161   TEXT,
  id10161_0   TEXT,
  id10161_1   TEXT,
  id10161_unit   TEXT,
  id10162   TEXT,
  id10163   TEXT,
  id10165   TEXT,
  id10166   TEXT,
  id10167   TEXT,
  id10167_a   TEXT,
  id10167_b   TEXT,
  id10167_c   TEXT,
  id10167_units   TEXT,
  id10168   TEXT,
  id10169   TEXT,
  id10169_a   TEXT,
  id10169_b   TEXT,
  id10169_c   TEXT,
  id10169_units   TEXT,
  id10170   TEXT,
  id10171   TEXT,
  id10172   TEXT,
  id10173   TEXT,
  id10173_a   TEXT,
  id10173_nc   TEXT,
  id10174   TEXT,
  id10175   TEXT,
  id10176   TEXT,
  id10178   TEXT,
  id10178_unit   TEXT,
  id10179   TEXT,
  id10179_1   TEXT,
  id10181   TEXT,
  id10182   TEXT,
  id10182_a   TEXT,
  id10182_b   TEXT,
  id10182_units   TEXT,
  id10183   TEXT,
  id10184_a   TEXT,
  id10184_b   TEXT,
  id10184_c   TEXT,
  id10184_units   TEXT,
  id10185   TEXT,
  id10186   TEXT,
  id10187   TEXT,
  id10188   TEXT,
  id10189   TEXT,
  id10190_a   TEXT,
  id10190_b   TEXT,
  id10190_units   TEXT,
  id10191   TEXT,
  id10192   TEXT,
  id10193   TEXT,
  id10194   TEXT,
  id10195   TEXT,
  id10196   TEXT,
  id10196_unit   TEXT,
  id10197   TEXT,
  id10197_a   TEXT,
  id10198   TEXT,
  id10199   TEXT,
  id10200   TEXT,
  id10201   TEXT,
  id10201_a   TEXT,
  id10201_unit   TEXT,
  id10202   TEXT,
  id10203   TEXT,
  id10204   TEXT,
  id10205   TEXT,
  id10205_a   TEXT,
  id10205_unit   TEXT,
  id10206   TEXT,
  id10207   TEXT,
  id10208   TEXT,
  id10209   TEXT,
  id10209_a   TEXT,
  id10209_b   TEXT,
  id10209_units   TEXT,
  id10210   TEXT,
  id10211   TEXT,
  id10211_a   TEXT,
  id10211_b   TEXT,
  id10211_units   TEXT,
  id10212   TEXT,
  id10213   TEXT,
  id10213_a   TEXT,
  id10213_b   TEXT,
  id10213_units   TEXT,
  id10214   TEXT,
  id10215   TEXT,
  id10216   TEXT,
  id10216_a   TEXT,
  id10216_b   TEXT,
  id10216_units   TEXT,
  id10217   TEXT,
  id10218   TEXT,
  id10219   TEXT,
  id10220   TEXT,
  id10221   TEXT,
  id10222   TEXT,
  id10223   TEXT,
  id10224   TEXT,
  id10225   TEXT,
  id10226   TEXT,
  id10227   TEXT,
  id10228   TEXT,
  id10229   TEXT,
  id10230   TEXT,
  id10231   TEXT,
  id10232   TEXT,
  id10232_a   TEXT,
  id10232_b   TEXT,
  id10232_units   TEXT,
  id10233   TEXT,
  id10234   TEXT,
  id10235   TEXT,
  id10236   TEXT,
  id10237   TEXT,
  id10238   TEXT,
  id10239   TEXT,
  id10240   TEXT,
  id10241   TEXT,
  id10242   TEXT,
  id10243   TEXT,
  id10244   TEXT,
  id10245   TEXT,
  id10246   TEXT,
  id10247   TEXT,
  id10248   TEXT,
  id10248_a   TEXT,
  id10248_b   TEXT,
  id10248_units   TEXT,
  id10249   TEXT,
  id10250   TEXT,
  id10250_a   TEXT,
  id10250_b   TEXT,
  id10250_units   TEXT,
  id10251   TEXT,
  id10252   TEXT,
  id10253   TEXT,
  id10254   TEXT,
  id10255   TEXT,
  id10256   TEXT,
  id10257   TEXT,
  id10258   TEXT,
  id10259   TEXT,
  id10260   TEXT,
  id10261   TEXT,
  id10262   TEXT,
  id10262_a   TEXT,
  id10262_b   TEXT,
  id10262_units   TEXT,
  id10263   TEXT,
  id10264   TEXT,
  id10265   TEXT,
  id10266   TEXT,
  id10266_a   TEXT,
  id10266_b   TEXT,
  id10266_units   TEXT,
  id10267   TEXT,
  id10268   TEXT,
  id10269   TEXT,
  id10270   TEXT,
  id10271   TEXT,
  id10272   TEXT,
  id10273   TEXT,
  id10274   TEXT,
  id10274_a   TEXT,
  id10274_b   TEXT,
  id10274_c   TEXT,
  id10274_units   TEXT,
  id10275   TEXT,
  id10276   TEXT,
  id10277   TEXT,
  id10278   TEXT,
  id10279   TEXT,
  id10281   TEXT,
  id10282   TEXT,
  id10283   TEXT,
  id10284   TEXT,
  id10285   TEXT,
  id10286   TEXT,
  id10287   TEXT,
  id10288   TEXT,
  id10289   TEXT,
  id10290   TEXT,
  id10294   TEXT,
  id10295   TEXT,
  id10296   TEXT,
  id10297   TEXT,
  id10298   TEXT,
  id10299   TEXT,
  id10300   TEXT,
  id10301   TEXT,
  id10302   TEXT,
  id10303   TEXT,
  id10304   TEXT,
  id10305   TEXT,
  id10306   TEXT,
  id10307   TEXT,
  id10308   TEXT,
  id10309   TEXT,
  id10310   TEXT,
  id10312   TEXT,
  id10313   TEXT,
  id10314   TEXT,
  id10315   TEXT,
  id10315_a   TEXT,
  id10316   TEXT,
  id10317   TEXT,
  id10318   TEXT,
  id10319   TEXT,
  id10320   TEXT,
  id10321   TEXT,
  id10322   TEXT,
  id10323   TEXT,
  id10324   TEXT,
  id10325   TEXT,
  id10326   TEXT,
  id10327   TEXT,
  id10328   TEXT,
  id10329   TEXT,
  id10330   TEXT,
  id10331   TEXT,
  id10332   TEXT,
  id10333   TEXT,
  id10334   TEXT,
  id10335   TEXT,
  id10336   TEXT,
  id10337   TEXT,
  id10338   TEXT,
  id10339   TEXT,
  id10340   TEXT,
  id10342   TEXT,
  id10343   TEXT,
  id10344   TEXT,
  id10347   TEXT,
  id10351   TEXT,
  id10352   TEXT,
  id10352_a   TEXT,
  id10352_b   TEXT,
  id10352_units   TEXT,
  id10354   TEXT,
  id10355   TEXT,
  id10356   TEXT,
  id10357   TEXT,
  id10358   TEXT,
  id10358_units   TEXT,
  id10359   TEXT,
  id10359_a   TEXT,
  id10360   TEXT,
  id10361   TEXT,
  id10362   TEXT,
  id10363   TEXT,
  id10364   TEXT,
  id10365   TEXT,
  id10366   TEXT,
  id10367   TEXT,
  id10368   TEXT,
  id10369   TEXT,
  id10370   TEXT,
  id10371   TEXT,
  id10372   TEXT,
  id10373   TEXT,
  id10376   TEXT,
  id10377   TEXT,
  id10379   TEXT,
  id10379_unit   TEXT,
  id10380   TEXT,
  id10382   TEXT,
  id10383   TEXT,
  id10384   TEXT,
  id10385   TEXT,
  id10387   TEXT,
  id10388   TEXT,
  id10389   TEXT,
  id10391   TEXT,
  id10392   TEXT,
  id10393   TEXT,
  id10394   TEXT,
  id10395   TEXT,
  id10396   TEXT,
  id10397   TEXT,
  id10398   TEXT,
  id10399   TEXT,
  id10400   TEXT,
  id10401   TEXT,
  id10402   TEXT,
  id10403   TEXT,
  id10404   TEXT,
  id10405   TEXT,
  id10406   TEXT,
  id10408   TEXT,
  id10411   TEXT,
  id10412   TEXT,
  id10413   TEXT,
  id10414   TEXT,
  id10415   TEXT,
  id10416   TEXT,
  id10418   TEXT,
  id10419   TEXT,
  id10420   TEXT,
  id10421   TEXT,
  id10422   TEXT,
  id10423   TEXT,
  id10424   TEXT,
  id10425   TEXT,
  id10426   TEXT,
  id10427   TEXT,
  id10428   TEXT,
  id10429   TEXT,
  id10430   TEXT,
  id10431   TEXT,
  id10432   TEXT,
  id10433   TEXT,
  id10434   TEXT,
  id10435   TEXT,
  id10436   TEXT,
  id10437   TEXT,
  id10438   TEXT,
  id10439   TEXT,
  id10439_check   TEXT,
  id10440   TEXT,
  id10440_check   TEXT,
  id10441   TEXT,
  id10441_check   TEXT,
  id10442   TEXT,
  id10443   TEXT,
  id10444   TEXT,
  id10445   TEXT,
  id10446   TEXT,
  id10450   TEXT,
  id10451   TEXT,
  id10452   TEXT,
  id10453   TEXT,
  id10454   TEXT,
  id10455   TEXT,
  id10456   TEXT,
  id10457   TEXT,
  id10458   TEXT,
  id10459   TEXT,
  id10462   TEXT,
  id10463   TEXT,
  id10464   TEXT,
  id10465   TEXT,
  id10466   TEXT,
  id10467   TEXT,
  id10468   TEXT,
  id10469   TEXT,
  id10470   TEXT,
  id10471   TEXT,
  id10472   TEXT,
  id10473   TEXT,
  id10476   TEXT,
  id10477   TEXT,
  id10478   TEXT,
  id10479   TEXT,
  id10481   TEXT,
  id10482   TEXT,
  id10483   TEXT,
  id10484   TEXT,
  id10485   TEXT,
  id10486   TEXT,
  id10487   TEXT,
  id10488   TEXT,
  instancename   TEXT,
  isadult   TEXT,
  isadult1   TEXT,
  isadult2   TEXT,
  ischild   TEXT,
  ischild1   TEXT,
  ischild2   TEXT,
  isneonatal   TEXT,
  isneonatal1   TEXT,
  isneonatal2   TEXT,
  location   TEXT,
  photograph   TEXT,
  the_country   TEXT,
  this_username   TEXT,
  tz001   TEXT,
  tz002   TEXT,
  tz002_other   TEXT,
  tz003   TEXT,
  tz004   TEXT,
  tz004_other   TEXT,
  tz005   TEXT,
  tz005_a   TEXT,
  vaid   TEXT,
  PRIMARY KEY(instance_id)
);
