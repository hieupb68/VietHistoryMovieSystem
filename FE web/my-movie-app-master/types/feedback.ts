export interface Feedback {
  id?: number;
  movieId?: number;
  comment?: string;
  username?: string;
  vote?: number;
  classification?: "Normal" | "Dirty";
}
