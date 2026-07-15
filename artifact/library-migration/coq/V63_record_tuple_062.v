(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_062.
Record point_62 := mkPoint_62 { x_62 : nat; y_62 : nat }.

Definition to_pair_62 (p : point_62) : nat * nat := (x_62 p, y_62 p).
Definition from_pair_62 (q : nat * nat) : point_62 := mkPoint_62 (fst q) (snd q).
Definition weight_point_62 (p : point_62) : nat := x_62 p + y_62 p.
Definition weight_pair_62 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_62 : forall p : point_62, from_pair_62 (to_pair_62 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_62 : forall q : nat * nat, to_pair_62 (from_pair_62 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_62 : forall p : point_62, weight_pair_62 (to_pair_62 p) = weight_point_62 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_062.

