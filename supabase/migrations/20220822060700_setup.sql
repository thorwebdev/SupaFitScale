/** 
* USERS
* Note: This table contains user data. Users should only be able to view and update their own data.
*/
create type gender_enum as enum ('female', 'male');
create table users (
  id uuid references auth.users not null primary key,
  age integer,
  height integer,
  gender gender_enum
);
alter table users enable row level security;
create policy "Can view own user data." on users for select using (auth.uid() = id);
create policy "Can update own user data." on users for update using (auth.uid() = id);

/**
* This trigger automatically creates a user entry when a new user signs up via Supabase Auth.
*/ 
create function public.handle_new_user() 
returns trigger as $$
begin
  insert into public.users (id)
  values (new.id);
  return new;
end;
$$ language plpgsql security definer;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

/** 
* MESAUREMENTS
* Note: This table contains sensitive user data. Users should only be able to view and update their own data.
*/
create table measurements (
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  uid uuid references auth.users not null,
  weight numeric not null,
  bmi numeric,
  ideal_weight numeric,
  metabolic_age numeric,
  protein_percentage numeric,
  lbm_coefficient numeric,
  bmr numeric,
  fat numeric,
  muscle_mass numeric,
  bone_mass numeric,
  visceral_fat numeric,
  PRIMARY KEY (created_at, uid)
);
alter table measurements enable row level security;
create policy "Can view own measurements." on measurements for select using (auth.uid() = uid);
create policy "Can insert own measurements." on measurements for insert with check (auth.uid() = uid);