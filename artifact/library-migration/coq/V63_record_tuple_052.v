(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_052.
Record point_52 := mkPoint_52 { x_52 : nat; y_52 : nat }.

Definition to_pair_52 (p : point_52) : nat * nat := (x_52 p, y_52 p).
Definition from_pair_52 (q : nat * nat) : point_52 := mkPoint_52 (fst q) (snd q).
Definition weight_point_52 (p : point_52) : nat := x_52 p + y_52 p.
Definition weight_pair_52 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_52 : forall p : point_52, from_pair_52 (to_pair_52 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_52 : forall q : nat * nat, to_pair_52 (from_pair_52 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_52 : forall p : point_52, weight_pair_52 (to_pair_52 p) = weight_point_52 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_052.

