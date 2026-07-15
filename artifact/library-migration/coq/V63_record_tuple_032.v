(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_032.
Record point_32 := mkPoint_32 { x_32 : nat; y_32 : nat }.

Definition to_pair_32 (p : point_32) : nat * nat := (x_32 p, y_32 p).
Definition from_pair_32 (q : nat * nat) : point_32 := mkPoint_32 (fst q) (snd q).
Definition weight_point_32 (p : point_32) : nat := x_32 p + y_32 p.
Definition weight_pair_32 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_32 : forall p : point_32, from_pair_32 (to_pair_32 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_32 : forall q : nat * nat, to_pair_32 (from_pair_32 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_32 : forall p : point_32, weight_pair_32 (to_pair_32 p) = weight_point_32 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_032.

