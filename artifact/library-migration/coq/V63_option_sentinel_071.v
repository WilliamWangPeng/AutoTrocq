(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_071.
Definition enc_71 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_71 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_71 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_71 : forall o : option nat, dec_71 (enc_71 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_71 : forall o : option nat, enc_71 o = size_71 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_71 : forall o : option nat, enc_71 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_071.

